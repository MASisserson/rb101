# Letter Swap

=begin
PLAN

split the string into an array of words.

Take the last letter and put it in front. Delete the last letter.
Take the second letter and put in the back. Use map or something.

Join the words together with new spaces. Can I do that? Yes I can
=end

require 'pry'

# def swap(string)
#   words = string.split(' ')
#   words = words.each do |word|
#             next if word.size == 1
#             word.insert(0, word[-1])
#             word.chop!
#             word.insert(-1, word[1])
#             word[1] = ''
#           end
#   words.join(' ')
# end

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

p swap('Oh what a wondderful day it is')
p swap('Abcde')
p swap('a')

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
