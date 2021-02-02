# Twenty One Game

# Requirements
require 'yaml'

# Constants
MESSAGES = YAML.load_file('twenty_one_msg.yml')
CARD_VALUES = { 'A' => [11, 1], '1' => 1, '2' => 2, '3' => 3, '4' => 4,
                '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
                '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10 }
SUITS = %w(♥ ♦ ♣ ♠)
RANKS = %w(A 1 2 3 4 5 6 7 8 9 10 J Q K)
UNKNOWN_CARD = '???'

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

def display_twenty_one
  puts ' ________                                           ___'
  puts '|___  ___|_        __ ____  ___ ___  __/\__        / _ \ ___ ___   ____'
  puts '   |  |  \ \  __  / // __ \|  / _  \|_    _|_   _ | | | |  / _  \ / __ \ '
  puts '   |  |   \ \/  \/ /|  ____| | | |  | |  |_| \_/ /| |_| | | | |  |  ____|'
  puts '   |__|    \__/\__/  \____||___| |__|  \___|\   /  \___/|___| |__|\____|'
  puts '                                            /  / '
  puts '                                           /__/  '
end

def display_dealer_hand(dealer_hand, dealer_turn)
  puts yellow(MESSAGES['dealer_hand'] +
    ":#{calculate_hand_value('dealer', dealer_hand, dealer_turn)}")
  if dealer_turn
    dealer_hand.each { |card| display_card(card) }
  else
    display_face_down_card
    display_card(dealer_hand[1])
  end
  puts ""
  puts ""
end

def display_player_hand(player_hand)
  puts yellow(MESSAGES['player_hand'] +
    ":#{calculate_hand_value('player', player_hand)}")
  player_hand.each { |card| display_card(card) }
  puts ""
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
  hand_value > 21
end

def calculate_card_value_low(card)
  if card[1] == 'A'
    CARD_VALUES[card[1]][1]
  else
    CARD_VALUES[card[1]]
  end
end

def calculate_card_value_high(card)
  if card[1] == 'A'
    CARD_VALUES[card[1]][0]
  else
    CARD_VALUES[card[1]]
  end
end

def calculate_revealed_card(hand)
  calculate_card_value_high(hand[1])
end

def calculate_full_hand(hand)
  hand_value = 0
  hand.each { |card| hand_value += calculate_card_value_high(card) }
  if bust?(hand_value)
    hand_value = 0
    hand.each { |card| hand_value += calculate_card_value_low(card) }
  end

  hand_value
end

def calculate_hand_value(owner, hand, dealer_turn=true)
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

def stay
  nil
end

def player_move(deck, hand)
  prompt MESSAGES['hit_or_stay']
  answer = read_move
  if %w(1 h hit).include? answer
    hit!(deck, hand)
  else
    stay
  end
end

def dealer_move(deck, hand, dealer_turn=true)
  if calculate_hand_value('dealer', hand, dealer_turn) < 17
    deal_card(deck, hand)
  else
    stay
  end
end

def read_name
  prompt MESSAGES['name']
  name = String.new
  loop do
    print MESSAGES['player_name']
    name = gets.chomp.downcase.strip
    break if name_valid?(name)
    prompt MESSAGES['invalid_name']
  end
  name
end

def determine_winner(player_hand, dealer_hand)
  player_hand_value = calculate_hand_value('player', player_hand)
  dealer_hand_value = calculate_hand_value('dealer', dealer_hand)
  if bust?(player_hand_value)
    :player_busted
  elsif bust?(dealer_hand_value)
    :dealer_busted
  elsif player_hand_value > dealer_hand_value
    :player_value
  elsif dealer_hand_value > player_hand_value
    :dealer_value
  end
end

def play_again?
  prompt MESSAGES['play_again']
  yes?
end

# Primary Code
clear_screen
prompt MESSAGES['welcome']
display_twenty_one
sleep(3)

loop do
  deck = initialize_deck
  dealer_hand = []
  player_hand = []
  dealer_turn = false
  dealer_hit = true

  initial_deal(deck, dealer_hand, player_hand)
  loop do
    clear_screen
    display_dealer_hand(dealer_hand, dealer_turn)
    display_player_hand(player_hand)
    case dealer_turn
    when false then player_hit = player_move(deck, player_hand)
    when true  then dealer_hit = dealer_move(deck, dealer_hand)
    end

    player_hand_value = calculate_hand_value('player', player_hand)
    dealer_hand_value = calculate_hand_value('dealer', dealer_hand)

    dealer_turn = true if !player_hit

    break if bust?(player_hand_value) || bust?(dealer_hand_value)
    break if !player_hit && !dealer_hit
  end

  clear_screen
  display_dealer_hand(dealer_hand, dealer_turn)
  display_player_hand(player_hand)
  winner = determine_winner(player_hand, dealer_hand)
  display_winner(winner)

  play_again? ? next : break
end
