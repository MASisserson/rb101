# The End is Near But Not Here

require 'pry'

=begin

middle method
returns middle word in a string
counts spaces as the only thing separating words. punctuation is included in words
Edge cases:
  1. strings with even number of words - return both the middle words
  2. strings with only one word - return the single word
  3. strings with no words - return empty string

=end

def penultimate(string)
  string.split[-2]
end

# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'

def middle(string)
  words_array = string.split
  halfway = words_array.size/2
  return '' if words_array.empty?
  return words_array[halfway] if words_array.size.odd?
  [words_array[halfway - 1], words_array[halfway]].join ' '
end

p middle('last word') == 'last word'
p middle('Launch School is great!') == 'School is'
p middle('I am Paul.') == 'am'
p middle('') == ''
p middle('runner') == 'runner'
