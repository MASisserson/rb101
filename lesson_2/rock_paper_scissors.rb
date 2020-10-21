# rock_paper_scissors.rb

VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  puts "=> #{message}"
end

def convert(input)
  case input
  when 'rock'     then 1
  when 'paper'    then 2
  when 'scissors' then 3
  end
end

def display_result(player, computer)
  result = (convert(player) - convert(computer))

  case result
  when 1  then prompt "You won!"
  when 2  then prompt "Computer won!"
  when -1 then prompt "Computer won!"
  when -2 then prompt "You won!"
  when 0  then prompt "It's a tie!"
  end
end

loop do
  choice = String.new
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt "That's not a valid choice."
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose: #{choice}; Computer chose: #{computer_choice}"

  display_result(choice, computer_choice)
  # captures a piece of logic in one line

  prompt "Do you want to play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for playing. Good bye!"

# Final Thoughts:
# Ruby seems to search above a command for the requisite method.
# You can't call a method before the method is initiated.

# If the display_result method returned a string, you would add a prompt call
# before calling the display_results method

# I feel like the creation of another method and the use of case statements
# as above is a bit brutal, as far as answers go, but it does get rif of
# the rubocop complaint about there being too much complexity to the if
# statements that existed before. I also don't like that the logic of the
# rock paper scissors game is not entirely clear from the case statements.
