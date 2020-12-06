Keeping Track of wins and losses
2 options when you enter the game:
Best of one
Best of 9 (5 wins)
At end, computer asks if you are done or if you want to play a best of 9.
If say yes, you start playing a best of 9.


FINAL THOUGHTS:
Ruby seems to search above a command for the requisite method.
You can't call a method before the method is initiated.

If the display_result method returned a string, you would add a prompt call
before calling the display_results method

I feel like the creation of another method and the use of case statements
as above is a bit blunt, as far as answers go, but it does get rid of
the rubocop complaint about there being too much complexity to the if
statements that existed before. I also don't like that the logic of the
rock paper scissors game is not entirely clear from the case statements.

Keep in mind this trick for later: using CONSTANTS for repeated arrays


# loop do
#   choice = String.new
#   loop do
#     prompt "Choose one: #{VALID_CHOICES.join(', ')}"
#     choice = gets.chomp.downcase.strip

#     if ALLOWED_INPUT.include?(choice)
#       break
#     else
#       prompt MESSAGES['invalid']
#     end
#   end

#   if choice == 's'
#     loop do
#       confirmation_prompt = MESSAGES['confirmation_prompt']
#       prompt confirmation_prompt
#       decision = gets.chomp.downcase.strip

#       if %w(scissors 1).include?(decision)
#         input.clear.concat('scissors')
#         break
#       elsif %w(spock 2).include?(decision)
#         input.clear.concat('spock')
#         break
#       else
#         prompt MESSAGES['cannot_accept']
#       end
#     end
#   end

#   convert_to_valid_choice!(choice)

#   computer_choice = VALID_CHOICES.sample

#   prompt "You chose: #{choice}; Computer chose: #{computer_choice}"

#   result = calculate_result(choice, computer_choice)
#   display_result(result)

#   case result
#   when 1  then player_score += 1
#   when -1 then computer_score += 1
#   end
#   display_score(player_score, computer_score)

#   if first_round
#     first_round = false
#     true_feelings MESSAGES['best_of_nine']
#     true_feelings MESSAGES['request']
#     prompt MESSAGES['play_again?']
#     answer = gets.chomp.downcase.strip
#   end
#   if answer.start_with?('y')
#     best_of_nine = true
#   end
#   break unless best_of_nine
#   break if player_score > 4 || computer_score > 4
# end
