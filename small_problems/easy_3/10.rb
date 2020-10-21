# Palindromic Numbers

# Plan
# loop to generate an array from number
# compare the array to it's reverse. Return the boolean value.
# Only planning to work on integers

def palindromic_number?(number)
  array = []
  while number >= 1
    array << (number % 10)
    number /= 10
  end
  array == array.reverse
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
puts palindromic_number?(001221) == true # This doesn't work

# Final Thoughts:
# I do not know how to get around the issue that is caused by having 00s
# in front of a number added to code, except to just not do it.
# It seems that adding '0' in front of a number causes the number to be treated
# as a refernce to a different number. In this case, 01221 => 657. 
# This should not be an issue when acquiring user input as the user can only
# input as a string from commandline. Those 0's can then be eliminated,
# either during the input validation process or after using a different regex.
