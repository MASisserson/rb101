# Reversed Arrays (Part 2)

=begin

PEDAC
  Input: array
  Output: New array, no modifications to original

  Requirements:
    Single method
    Non-mutating
    Can take any array type

  Mental Model:
    Basically just like the previous, but make a copy in the method
    Return the copy.

  Algorithm:
    All same as reverse!, but make a copy of list in beginning.

=end

def reverse(list)
  list_copy = list.select { |x| x }
  for i in 1..(list_copy.size / 2)
    list_copy[i-1], list_copy[-i] = list_copy[-i], list_copy[i-1]
  end

  list_copy
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true
