# All Substrings

require 'pry'

def substrings(string)
  start = 0
  array = []
  loop do
    1.upto(string.size - start) { |count| array << string[start, count] }
    break if start == string.size
    start += 1
  end

  array
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
