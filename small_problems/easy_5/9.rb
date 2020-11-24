# ddaaiillyy ddoouubbllee

=begin
Have to identify to characters simultaneously.
Create a second array.
Push the the first character from the first array to the second.
Compare first character to second character. If same, do not move.
If different, move second character to the second array. Loop.

=end

def crunch(string)
  array = string.chars
  no_repeats = []
  no_repeats.push(array[0])
  for i in 0..(array.size - 1)
    no_repeats.push(array[i+1]) if array[i] != array[i+1]
  end

  no_repeats.join
end

p crunch('ddaaiillyy ddoouubbllee')# == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
