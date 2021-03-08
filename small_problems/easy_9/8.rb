# Sequence Count

=begin

1. make a new array
  1. Also make copy of start_integer variable
2. start a loop
  1. break if array.size == size
  2. array << start_integer_copy
  3. start_integer_copy += start_integer
3. Return new array

=end

# def sequence(size, start_integer)
#   sequence_array = []
#   increment_value = start_integer
#   loop do
#     break if sequence_array.size == size
#     sequence_array << increment_value
#     increment_value += start_integer
#   end

#   sequence_array
# end

def sequence(count, first)
  (1..count).map { |value| value * first }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

p sequence(-3, 5)
