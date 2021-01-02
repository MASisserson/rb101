# rock_paper_scissors.rb

require 'yaml'

MESSAGES      = YAML.load_file('rps_messages.yml')
VALID_CHOICES = %w(rock paper scissors spock lizard)
ALLOWED_INPUT = %w(r ro roc rock
                   p pa pap pape paper
                   s sc sci scis sciss scisso scissor scissors
                   sp spo spoc spock
                   l li liz liza lizar lizard)
WINS_NEEDED   = 5

# PERSONALITY
def clear_screen
  system('clear') || system('cls')
end

def prompt(message)
  puts "=> #{message}"
end

def true_feelings(message)
  puts "~[>_<]~ #{message}"
end

def offer_challenge
  true_feelings MESSAGES['best_of_nine']
  true_feelings MESSAGES['request']
end

def parting_message(scores)
  if scores[:player] >= 5
    true_feelings MESSAGES['bested']
    true_feelings MESSAGES['sulk']
  elsif scores[:computer] >= 5
    true_feelings MESSAGES['gloat']
  else
    true_feelings MESSAGES['good_bye']
  end
  prompt MESSAGES['exit']
end

# PRIMARY FUNCTION METHODS
def request_choice
  choice = String.new
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    choice = gets.chomp.downcase.strip

    break if ALLOWED_INPUT.include?(choice)

    prompt MESSAGES['invalid']
  end

  choice
end

def confirm_choice!(choice)
  loop do
    prompt MESSAGES['confirmation_prompt']
    decision = gets.chomp.downcase.strip

    if %w(scissors 1).include?(decision)
      choice.clear.concat('scissors')
      break
    elsif %w(spock 2).include?(decision)
      choice.clear.concat('spock')
      break
    else
      prompt MESSAGES['cannot_accept']
    end
  end
end

def convert_to_valid_choice!(input)
  allowed_index = ALLOWED_INPUT.index(input)

  case allowed_index
  when 0..3   then input.clear.concat('rock')
  when 4..8   then input.clear.concat('paper')
  when 10..16 then input.clear.concat('scissors')
  when 17..20 then input.clear.concat('spock')
  when 21..26 then input.clear.concat('lizard')
  end
end

def get_player_choice
  choice = request_choice()
  confirm_choice!(choice) if choice == 's'
  convert_to_valid_choice!(choice)

  choice
end

def display_choices(player_choice, computer_choice)
  prompt "You chose: #{player_choice}; Computer chose: #{computer_choice}"
end

def calculate_result(player, computer)
  score = VALID_CHOICES.index(player) - VALID_CHOICES.index(computer)
  if [1, 3, -2, -4].include?(score)
    1
  elsif [2, 4, -1, -3].include?(score)
    -1
  else
    0
  end
end

def display_result(score)
  case score
  when 1  then prompt MESSAGES['win']
  when -1 then prompt MESSAGES['loss']
  when 0  then prompt MESSAGES['tie']
  end
end

def update_scores(scores, result)
  case result
  when 1  then scores[:player]   += 1
  when -1 then scores[:computer] += 1
  end
end

def display_scores(scores)
  prompt "Player: #{scores[:player]}"
  prompt "Computer: #{scores[:computer]}"
end

def play_again?
  answer = String.new
  loop do
    prompt MESSAGES['play_again?']
    answer = gets.chomp.downcase.strip
    break if %w(y yes n no).include?(answer)
    prompt MESSAGES['cannot_accept']
    prompt MESSAGES['yes_or_no']
  end
  answer.start_with?('y')
end

def someone_winner?(scores)
  scores[:player] > 4 || scores[:computer] > 4
end

# MAIN
scores = { player: 0, computer: 0 }
first_round = true

clear_screen()
prompt MESSAGES['welcome']

loop do
  player_choice = get_player_choice()

  computer_choice = VALID_CHOICES.sample

  clear_screen()
  display_choices(player_choice, computer_choice)
  result = calculate_result(player_choice, computer_choice)
  display_result(result)
  update_scores(scores, result)
  display_scores(scores)

  best_of_nine = true
  if first_round
    first_round = false
    offer_challenge()
    best_of_nine = play_again?()
  end

  break unless best_of_nine
  break if someone_winner?(scores)
end

parting_message(scores)
