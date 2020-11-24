# Letter Counter (Part 1)

=begin
create a hash
split by ' ' into an array
if else statement that finds word length in hash
  if not found, initialize key with value of 1
  if found, += the value by 1
etc.
return hash
=end

def word_sizes(string)
  size_quantities = Hash.new(0)
  string.split.each { |words| size_quantities[words.size] += 1 }
  
  size_quantities
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
