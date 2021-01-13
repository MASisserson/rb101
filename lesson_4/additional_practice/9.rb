# Question 8

=begin

Problems
1. Identitying words despite nonletters being present
2. Capitalizing each word
3. Decapitalizing the words that are prepositions, articles, and conjunctions
4. Capitalizing the first word, no matter what

constants
  prepositions
  articles
  conjunctions

Method
  

=end

def titleize(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

words = 'the flintstones rock'

p titleize(words)
