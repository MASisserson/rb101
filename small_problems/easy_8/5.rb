# Palindromic Substrings

=begin

RESULT
  Takes a string argument and returns an array of strings containing all the palindromes in the original string.
  If no palindromes, returns an empty array

MECHANISM
  Start from an array of all sub-strings in the string
  Check each sub-string to see if it is a palindrome
  Assign each palindrome sub-string to a new array named palindrome_array
  Return said array

PROGRAMING NOTES
  Write separate is_palindrome? method
    convert string into array with #chars
    make a reverse array
    compare array with reverse array
  Go through sub-string array with #each and assign to palindrome_array if #is_palindrome?

=end

def substrings(string)
  start = 0
  substring_array = []
  loop do
    1.upto(string.size - start) { |count| substring_array << string[start, count] }
    break if start == string.size
    start += 1
  end

  substring_array
end

def is_palindrome?(string)
  return false if string.size <= 1
  string.chars == string.chars.reverse
end

def palindromes(string)
  string_array = substrings(string)
  palindrome_array = Array.new
  string_array.each { |string| palindrome_array << string if is_palindrome?(string) }
  palindrome_array
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
