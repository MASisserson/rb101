require 'yaml'

MESSAGES = YAML.load_file('ttt_msg.yml')
FIRST_MOVE = 'choose' # valid choices are 'choose', 'player', 'computer'
INITIAL_MARKER  = ' '
PLAYER_MARKER   = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]] # diagonal
BOARD_CENTER = 5

# Display Methods
def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end

def green(text)
  colorize(text, 32)
end

def prompt(msg)
  puts "=> #{green(msg.to_s)}"
end

def clear_screen
  system 'clear'
end

# rubocop:disable Style/For
def joinor(array, punctuation=', ', conjunction='or')
  return array.join if array.size <= 1
  return "#{array[0]} #{conjunction} #{array[1]}" if array.size == 2
  number_string = String.new
  for i in (0..(array.size - 1)) do
    if i == (array.size - 1)
      number_string << "#{conjunction} #{array[i]}"
      next
    end
    number_string << "#{array[i]}#{punctuation}"
  end
  number_string
end
# rubocop:enable Style/For

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  puts green("You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}.")
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def display_round_result(brd)
  if someone_won_round?(brd)
    prompt "#{detect_winner(brd)} won!"
  else
    prompt MESSAGES['tie']
  end
end

def display_score(score)
  prompt "Player: #{score[:player]}, Computer: #{score[:computer]}"
end

# Gameplay Methods
def choose_who_goes_first
  case FIRST_MOVE
  when 'choose'
    loop do
      prompt MESSAGES['first_move']
      answer = gets.chomp.downcase.strip
      return answer if %w(player computer).include? answer

      prompt MESSAGES['player_or_computer']
    end
  when 'player'   then 'player'
  when 'computer' then 'computer'
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = String.new
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt MESSAGES['invalid_choice']
  end
  brd[square] = PLAYER_MARKER
end

def computer_offense_condition(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2
      square = line.select { |position| brd[position] != COMPUTER_MARKER }.first
      return square if empty_squares(brd).include? square
    end
  end
  nil
end

def computer_defense_condition(brd)
  WINNING_LINES.each do |line| # Add line for computer about to win
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      square = line.select { |position| brd[position] != PLAYER_MARKER }.first
      return square if empty_squares(brd).include? square
    end
  end
  nil
end

def computer_opening(brd)
  return BOARD_CENTER if brd[BOARD_CENTER] == INITIAL_MARKER
  nil
end

def computer_plan(brd)
  return computer_offense_condition(brd) if !!computer_offense_condition(brd)
  return computer_defense_condition(brd) if !!computer_defense_condition(brd)
  return computer_opening(brd) if !!computer_opening(brd)
  nil
end

def computer_places_piece!(brd)
  strategy = computer_plan(brd)
  case !!strategy
  when true  then brd[strategy] = COMPUTER_MARKER
  when false then brd[empty_squares(brd).sample] = COMPUTER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won_round?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if    brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def update_score(brd, score)
  case detect_winner(brd)
  when 'Player'   then score[:player] += 1
  when 'Computer' then score[:computer] += 1
  end
end

def best_of_nine?
  prompt MESSAGES['best_of_9']
  loop do
    answer = gets.chomp.downcase.strip
    if    %w(y yes).include? answer
      return true
    elsif %w(n no).include? answer
      return false
    else
      prompt MESSAGES['cannot_accept']
      prompt MESSAGES['yes_or_no']
    end
  end
end

def place_piece!(brd, player)
  player_places_piece!(brd) if player == 'player'
  computer_places_piece!(brd) if player == 'computer'
end

def alternate_player(current_player)
  %w(player computer).select { |participant| participant != current_player }[0]
end

def game_over?(score)
  return true if score[:player] >= 5 || score[:computer] >= 5
end

score = { player: 0, computer: 0 }
first_round = true

prompt MESSAGES['welcome']
current_player = choose_who_goes_first

loop do # Main Loop
  board = initialize_board

  loop do # Gameplay Loop
    clear_screen if first_round == false
    display_board(board)
    display_score(score) if first_round == false
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won_round?(board) || board_full?(board)
  end

  display_board(board)
  display_round_result(board)
  update_score(board, score)
  sleep(1) if !first_round

  if first_round
    break unless best_of_nine?
    first_round = false
  end
  break if game_over?(score)
end

prompt MESSAGES['goodbye']
