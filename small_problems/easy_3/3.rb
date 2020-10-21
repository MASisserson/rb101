# Counting the Number of Characters

# Algorithm
# Ask for input
# #chars then delete spaces
# return number of characters

print "Please write a word or multiple words: "
input = gets.chomp
characters = input.chars
characters.delete(' ')
puts "There are #{characters.size} characters in \"#{input}\"."


# Final Thoughts:
# I didn't realize you could call size on a string. I should remember that.
