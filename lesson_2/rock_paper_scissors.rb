# rock_paper_scissors.rb

# Keeping Track of wins and losses
# 2 options when you enter the game:
# Best of one
# Best of 9 (5 wins)
# At end, computer asks if you are done or if you want to play a best of 9.
# If say yes, you start playing a best of 9.

VALID_CHOICES = %w(rock paper scissors spock lizard)
ALLOWED_INPUT = %w(r ro roc rock
                   p pa pap pape paper
                   s sc sci scis sciss scisso scissor scissors
                   sp spo spoc spock
                   l li liz liza lizar lizard)

def prompt(message)
  puts "=> #{message}"
end

def true_feelings(message)
  puts "$$ #{message}"
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
  when 1  then prompt "You won!"
  when -1 then prompt "Computer won!"
  when 0  then prompt "It's a tie!"
  end
end

def display_score(player, computer)
  prompt "Player: #{player}"
  prompt "Computer: #{computer}"
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

player_score = 0
computer_score = 0
best_of_nine = false
first_round = true
answer = ''
loop do
  choice = String.new
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    choice = gets.chomp.downcase.strip

    if ALLOWED_INPUT.include?(choice)
      break
    else
      prompt "That's not a valid choice."
    end
  end

  if choice == 's'
    loop do
      confirmation_prompt = <<-MSG
What did you mean by 's'?
    1. scissors
    2. spock
  MSG
      prompt confirmation_prompt
      decision = gets.chomp.downcase.strip

      if %w(scissors 1).include?(decision)
        input.clear.concat('scissors')
        break
      elsif %w(spock 2).include?(decision)
        input.clear.concat('spock')
        break
      else
        prompt "I'm sorry. I'm not made to accept that answer."
      end
    end
  end

  convert_to_valid_choice!(choice)

  computer_choice = VALID_CHOICES.sample

  prompt "You chose: #{choice}; Computer chose: #{computer_choice}"

  result = calculate_result(choice, computer_choice)
  display_result(result)

  case result
  when 1  then player_score += 1
  when -1 then computer_score += 1
  end
  display_score(player_score, computer_score)

  if first_round
    first_round = false
    true_feelings "Is that all you've got? Let's make this a best of 9."
    true_feelings "Wad'ya say?"
    prompt "Type 'yes' if you wish to play again."
    answer = gets.chomp.downcase.strip
  end
  if answer.start_with?('y')
    best_of_nine = true
  end
  break unless best_of_nine
  break if player_score > 4 || computer_score > 4
end

true_feelings "I was just starting ot have fun..." if !best_of_nine
final_score_message = <<-MSG
Final Score:
Player: #{player_score}
Computer: #{computer_score}
MSG

if player_score >= 5
  true_feelings "Well done. You got the best of me."
  true_feelings "I'm gonna go sulk now."
  prompt final_score_message
elsif computer_score >= 5
  true_feelings "Well would you look at that."
  prompt final_score_message
end

# Final Thoughts:
# Ruby seems to search above a command for the requisite method.
# You can't call a method before the method is initiated.

# If the display_result method returned a string, you would add a prompt call
# before calling the display_results method

# I feel like the creation of another method and the use of case statements
# as above is a bit blunt, as far as answers go, but it does get rid of
# the rubocop complaint about there being too much complexity to the if
# statements that existed before. I also don't like that the logic of the
# rock paper scissors game is not entirely clear from the case statements.

# Keep in mind this trick for later: using CONSTANTS for repeated arrays
