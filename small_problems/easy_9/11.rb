# Group Anagrams

=begin

input: array of strings
output: printed arrays of strings that are anagrams of each other. Each array should be on a new line.
return: none specified

Rules:
1. Anagrams have the same letters in the same quanitities
2. A single method call should output anywhere from 0 to multiple lines of arrays


Mental Model:
# 1. Identify anagrams (method)
#   - if two strings converted to a sorted array are equivalent, they are anagrams.
2. Create copy of words_array
3. Create a hash that contains all the anagrams sorted by sorted array keys (method)
  {
    ['d', 'e', 'm', 'o'] => ['demo', 'dome', mode']
    etc.
  }
    1. iterate through the words_array
    2. Compare the char-sorted word to they keys in the hash
      - If there is a key like it, the word will be added under that key as word
      - If there is no key, a key will be added with a value of [word]
    3. Return the hash
4. Iterate through the hash, printing arrays larger than 1 element in size.

=end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

["demo", "dome", "mode"]
["neon", "none"]
#(etc)

def list_anagrams(words_array)
  anagrams = Hash.new
  
  words_array.each do |word|
    if anagrams.keys.include? word.chars.sort
      anagrams[word.chars.sort] << word
    else
      anagrams[word.chars.sort] = [word]
    end
  end

  anagrams
end

def anagrams(words_array)
  copy_arr = words_array.dup
  anagrams = list_anagrams(copy_arr)
  anagrams.each_value { |array| p array.sort if array.size > 1 }
end

anagrams(words)
