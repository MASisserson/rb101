# Word to Digit

=begin

Input: String
Output: string with spelled out numbers written as integer_string numbers

Mental model:
Cut apart string elements with split and iterate through, looking for words from a hash. Convert using hash.

=end

require 'pry'

NUMBER_STRINGS = {
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}

def word_to_digit(string)
  string_copy = string.dup
  NUMBER_STRINGS.each do |k,v|
    string_copy.gsub!(k, v)
  end

  string_copy
  # string.split.map do |word|
  #   if NUMBER_STRINGS.keys.include? word
  #     NUMBER_STRINGS[word]
  #   else
  #     word
  #   end
  # end.join ' '
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
