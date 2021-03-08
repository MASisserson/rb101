# Double Char (Part 2)

def double_consonants(string)
  string.chars.map do |character|
    character.gsub(/[^aeiou\d\W_]/, (character + character))
  end.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
