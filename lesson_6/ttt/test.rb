# Method test file

require 'pry'

=begin

Needs to use default array punctuation for arrays > 2. No punctuation default for arrays == 2
Create if statement for array.size == 2 that uses no punctuation
Set default punctuation to ','

=end

def joinor(array, punctuation=', ', conjunction='or')
  return array.join if array.size <= 1
  return "#{array[0]} #{conjunction} #{array[1]}" if array.size == 2
  number_string = String.new
  for i in (0..(array.size - 1)) do
    if i == (array.size - 1)
      number_string << "#{conjunction} #{array[i]}"
      next
    end
    number_string << "#{array[i]}#{punctuation}"
  end
  number_string
end

p joinor([1, 2])                   # => "1 or 2"
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
