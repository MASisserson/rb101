# Reverse It (Part 1)

require 'pry'

def reverse_sentence(sentence)
  # arr = sentence.split
  # arr.reverse!
  # string = String.new
  # count = 0

  # loop do
  #   if count == 0
  #     string << (arr[count])
  #   else
  #     string << (' ' + arr[count])
  #   end
  #   count += 1
  #   break if count == arr.size
  # end

  # string

  sentence.split.reverse.join(' ')
  
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
