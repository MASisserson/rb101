# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

=begin

input: string
output: array of substrings

Rules:
  Evaluate case sensitive
  Assume single words

Mental Model:
  1. Cut out all potential substrings
  2. Evaluate each substring to see if palindrome
  3. Return final array

Algorithm:
  Separate methods for cutting out potential substrings = substring()
  Separate method for evaluating each substring for palindrome = palindrome?()
  


=end

# Test cases:

p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []
