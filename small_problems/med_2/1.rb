file = File.open("frankenstein.txt")
file_data = file.read

p file_data.gsub(/\n/, ' ')

=begin

input: a string as long as a book, potentially containing newline characters
ouput: The longest sentence in the string. The number of words in that string.

Rules:
1. Sentences are separated by periods (.), exclamation points (!), and question marks (?)
2. A word is any group of characters that don't contain spaces or sentence enders inside of them.

Problems:
1. Keeping track of an array containing all sentences in the book might result in too large an array.
1.5 How to eliminate newline character?
  gsub newline characters into spaces.

2. How to iterate through each sentence without turning all of them into a giant array?
    1. If I iterate through every character in the string, I can pass each character to an array until a sentence stop character is found.
      1. Sentence stop characters should be recorded in a constant
    2. Join the array
      Part of word_count method
    3. split the array by spaces and count the elements therein.
      part of word_count method
    4. Record that array and the count as the current_sentence variable if current_sentence[1] (the count) is less than this sentence


    Further explained:
      A continuous iteration will run through the document string.
      During this iteration, each character of the string will be appended to an array for storage
      When a sentence ender is found, a sub-process will begin
        Here, the array will be joined into a string
        The string will be passed to word_count
        If the string has more words than the current_sentence, it will replace current_sentence
        The array will be reset to an empty array so that it can be populated by the next sentence.

3. How to count the words in a sentence? (method)
  1. After splitting the sentence_string, the array elements merely need to be counted

Mental Model:
1. 1 variable needs to be tracked, first the current sentence, second the next sentence
  1. The current sentence is either the first in the string, or the longest we have come upon so far
  # 2. The next sentence is the next sentence in the string that must be evaluated.
    At first it is the second sentence in the string
    Then, it is the next sentence to be evaluated in order from beginning to end in the string.
2. The current sentence becomes the second sentence if the second sentence has more words than the current one.
3. At the end of the string, the current sentence is returned and the words in it counted.
4. The sentence is printed alongside the number words that make it up.

=end

SENTENCE_ENDERS = ['.', '!', '?']

def word_count(string)
  string.split(' ').size
end

def sentence_comparison(new_sentence_array, current_longest)
  new_sentence = new_sentence_array.join
  sentence_size = word_count(new_sentence)
  if sentence_size > current_longest[1]
    current_longest[0] = new_sentence
    current_longest[1] = sentence_size
  end
  new_sentence_array.select! { |_| false }
end

def longest_sentence(file_string)
  new_sentence_array = []
  current_longest = ['', 0]

  file_string.gsub(/\n/, ' ').each_char do |char|
    new_sentence_array << char
    if SENTENCE_ENDERS.include? char
      sentence_comparison(new_sentence_array, current_longest)
    end
  end

  p current_longest[0]
  p current_longest[1]
end

longest_sentence(file_data)
