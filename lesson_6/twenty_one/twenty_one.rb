# Twenty One Game

# Requirements
require 'yaml'

# Constants
MESSAGES = YAML.load_file('twenty_one_msg.yml')
CARD_VALUES = { 'A' => 11, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
                '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
                '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10 }
SUITS = %w(♥ ♦ ♣ ♠)
RANKS = %w(A 1 2 3 4 5 6 7 8 9 10 J Q K)
UNKNOWN_CARD = '???'
MAX_HAND_VALUE = 21 # Bust after a hand value of this number
WINNING_SCORE = 5 # Sets the number of wins requested

# Display Methods
def clear_screen
  system 'clear'
end

def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end

def yellow(text)
  colorize(text, 33)
end

def green(text)
  colorize(text, 32)
end

def red(text)
  colorize(text, 31)
end

def prompt(msg)
  puts "=> #{green(msg)}"
end

def display_new_line(number)
  number.times { puts "" }
end

def display_red_card_value(card)
  if card[1] == '10'
    puts "|#{red(card[0].to_s)}#{red(card[1].to_s)}|"
  else
    puts "|#{red(card[0].to_s)} #{red(card[1].to_s)}|"
  end
end

def display_red_card(card)
  puts " ___ "
  puts "|   |"
  display_red_card_value(card)
  puts "|___|"
end

def display_black_card_value(card)
  if card[1] == '10'
    puts "|#{card[0]}#{card[1]}|"
  else
    puts "|#{card[0]} #{card[1]}|"
  end
end

def display_black_card(card)
  puts " ___ "
  puts "|   |"
  display_black_card_value(card)
  puts "|___|"
end

def display_card(card)
  if %w(♥ ♦).include? card[0]
    display_red_card(card)
  else
    display_black_card(card)
  end
end

def display_face_down_card
  puts " ___ "
  puts "|   |"
  puts "|#{UNKNOWN_CARD}|"
  puts "|___|"
end

def display_title
  puts ' __        __ __                              _____    '
  puts '|  |      |  |  |____   ____ _ __/\__        /  _  \ ___ ___   ____'
  puts '|  |  /\  |  |  / _  \ / _  | |_    _|  __  |  | |  |  / _  \ / __ \ '
  puts ' \  \/  \/  /| | | |  | |_|   | |  |_  |__| |  |_|  | | | |  |  ____|'
  puts '  \___/\___/ |___| |__|\____|_|  \___|       \_____/|___| |__|\____|'
end

def display_hand_max
  prompt "Max Hand Value before bust: #{red(MAX_HAND_VALUE.to_s)}"
end

def display_dealer_hand(dealer_hand, dealer_total, dealer_turn=true)
  puts yellow(MESSAGES['dealer_hand'] +
    ":#{dealer_total}")
  if dealer_turn
    dealer_hand.each { |card| display_card(card) }
  else
    display_face_down_card
    display_card(dealer_hand[1])
  end
  display_new_line(2)
end

def display_player_hand(player_hand, player_total)
  puts yellow(MESSAGES['player_hand'] +
    ":#{player_total}")
  player_hand.each { |card| display_card(card) }
  display_new_line(1)
end

def display_score(score)
  puts "Your wins:   #{score[:player]}"
  puts "Dealer wins: #{score[:dealer]}"
end

def display_winner(winner)
  case winner
  when :player_value
    prompt MESSAGES['player_won_value']
  when :dealer_busted
    prompt MESSAGES['player_won_bust']
  when :dealer_value
    prompt MESSAGES['dealer_won_value']
  when :player_busted
    prompt MESSAGES['dealer_won_bust']
  else
    prompt MESSAGES['tie']
  end
end

def display_grand_champion(score)
  if score[:player] == WINNING_SCORE
    prompt MESSAGES['player_champion']
  elsif score[:dealer] == WINNING_SCORE
    prompt MESSAGES['dealer_champion']
  end
end

# Input Validation Methods
def name_valid?(name)
  !name.empty?
end

def read_move
  answer = String.new
  loop do
    answer = gets.chomp.downcase.strip
    break if %w(1 2 h hit s stay).include? answer
    prompt MESSAGES['unclear_response']
  end

  answer
end

def yes?
  loop do
    answer = gets.chomp.downcase.strip
    if    %w(y yes).include? answer
      return true
    elsif %w(n no).include? answer
      return false
    end
    prompt MESSAGES['yes_or_no_only']
  end
end

# Gameplay methods
def initialize_deck
  new_deck = Array.new
  SUITS.each do |suite|
    RANKS.each do |rank|
      new_deck << [suite, rank]
    end
  end

  new_deck
end

def deal_card(deck, hand)
  hand << deck.shuffle!.shift
end

def initial_deal(deck, dealer_hand, player_hand)
  2.times do
    deal_card(deck, dealer_hand)
    deal_card(deck, player_hand)
  end
end

def bust?(hand_value)
  hand_value > MAX_HAND_VALUE
end

def calculate_card_value(card)
  CARD_VALUES[card[1]]
end

def calculate_revealed_card(hand)
  calculate_card_value(hand[1])
end

def aces(hand)
  hand.select { |card| card[1] == 'A' }.size
end

def calculate_full_hand(hand)
  hand_value = 0
  hand.each { |card| hand_value += calculate_card_value(card) }
  until aces(hand)
    if bust?(hand_value)
      aces -= 1
      hand_value -= 10
    end
  end

  hand_value
end

def total(owner, hand, dealer_turn=true)
  case owner
  when 'player' then calculate_full_hand(hand)
  when 'dealer'
    return calculate_revealed_card(hand) if !dealer_turn
    calculate_full_hand(hand)
  end
end

def hit!(deck, hand)
  deal_card(deck, hand)
end

def player_move(deck, hand)
  prompt MESSAGES['hit_or_stay']
  hit!(deck, hand) if %w(1 h hit).include? read_move
end

def dealer_move(deck, hand, dealer_total)
  deal_card(deck, hand) if dealer_total < (MAX_HAND_VALUE - 4)
end

def determine_winner(player_total, dealer_total)
  if bust?(player_total)
    :player_busted
  elsif bust?(dealer_total)
    :dealer_busted
  elsif player_total > dealer_total
    :player_value
  elsif dealer_total > player_total
    :dealer_value
  end
end

def modify_score!(score, winner)
  case winner
  when :player_busted then score[:dealer] += 1
  when :dealer_busted then score[:player] += 1
  when :player_value  then score[:player] += 1
  when :dealer_value  then score[:dealer] += 1
  end
end

def best_of_nine?
  prompt "Would you like to play a first to #{WINNING_SCORE}? (y/n)"
  yes?
end

def champion_crowned?(score)
  score[:player] == WINNING_SCORE || score[:dealer] == WINNING_SCORE
end

# Primary Code
clear_screen
score = { player: 0, dealer: 0 }
first_round = true

prompt MESSAGES['welcome']
display_title
sleep(3)

loop do
  deck = initialize_deck
  dealer_hand = []
  player_hand = []
  dealer_turn = false
  dealer_hit = true

  initial_deal(deck, dealer_hand, player_hand)
  player_total = total('player', player_hand)
  dealer_total = total('dealer', dealer_hand, dealer_turn)

  loop do
    clear_screen
    display_dealer_hand(dealer_hand, dealer_total, dealer_turn)
    display_player_hand(player_hand, player_total)
    display_hand_max
    case dealer_turn
    when false then player_hit = player_move(deck, player_hand)
    when true  then dealer_hit = dealer_move(deck, dealer_hand, dealer_total)
    end

    player_total = total('player', player_hand)
    dealer_total = total('dealer', dealer_hand, dealer_turn)

    dealer_turn = true if !player_hit

    break if bust?(player_total) || bust?(dealer_total)
    break if !player_hit && !dealer_hit
  end

  clear_screen
  player_total = total('player', player_hand)
  dealer_total = total('dealer', dealer_hand)
  display_dealer_hand(dealer_hand, dealer_total)
  display_player_hand(player_hand, player_total)
  winner = determine_winner(player_total, dealer_total)
  display_winner(winner)
  modify_score!(score, winner)
  display_score(score) if !first_round
  sleep(2) if !first_round

  if champion_crowned?(score)
    display_grand_champion(score)
    break
  end

  if first_round
    first_round = false
    best_of_nine? ? next : break
  end
end

prompt MESSAGES['goodbye']
