# Getting Things Done

def move(n, from_array, to_array)
  return nil if n <= 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

=begin

A SystemStackError means that the system's stack overflowed. The recursion here took up too much memory, exceeding the alloted amount for the program.
The program was then stopped and the error give.
This problem was caused because there was no stop condition in the `move` method definition.

=end
