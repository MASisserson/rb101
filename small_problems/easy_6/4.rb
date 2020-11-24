# Reversed Arrays (Part 1)

=begin

PEDAC
  Input: Array
  Output: Same array object, reversed

  Requirements:
    Has to be a mutating method.
  
  Data Structure: Arrays

  Mental Model and Algorithm:
    Define 2 variables for the beginning and end.
    (array.size / 2).times do (prob should use for loop)
      work from both directions, assigning values to beg and end and swapping

=end

def reverse!(list)
  for i in 1..(list.size / 2)
    list[i-1], list[-i] = list[-i], list[i-1]
  end

  list
end

# list = [1,2,3,4]
# result = reverse!(list)
# p result == [4, 3, 2, 1]
# p list == [4, 3, 2, 1]
# p list.object_id == result.object_id

# list = %w(a b e d c)
# p reverse!(list) == ["c", "d", "e", "b", "a"]
# p list == ["c", "d", "e", "b", "a"]

# list = ['abc']
# p reverse!(list) == ["abc"]
# p list == ["abc"]

list = []
p reverse!(list) == []
p list == []
