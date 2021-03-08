# Double Char(Part 1)

def repeater(string)
  string.chars.zip(string.chars).flatten.join
end

p repeater('Hello')# == "HHeelllloo"
p repeater("Good job!")# == "GGoooodd  jjoobb!!"
p repeater('')# == ''
