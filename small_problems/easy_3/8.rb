# Palindromic Strings (Part 1)

# Model
# Take apart the string into characters, flip them around, and join together

# Algorithm
# Same as above.

def palindrome?(arg)
  arg == arg.reverse
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true
puts palindrome?([1,2,3,4,5]) == false
puts palindrome?([1,2,3,2,1]) == true
puts palindrome?([1]) == true
puts palindrome?([1,2,3,3,2,1]) == true


# Final Thoughts:
# Simplicity is fantastic for a number of reasons. One of the big ones is that
# it is more likely to work in a greater number of situations, with a greater
# number of data types. #chars and #join are not only redundant, but also get
# in the way.
