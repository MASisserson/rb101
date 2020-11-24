# Combining Arrays

=begin

PEDAC
  Input: 2 arrays
  Output: 1 new, merged array with no duplicate elements

  Requirements:
    No duplicate values at end
    New array, nondestructive
    returns array
    sorts the new array, I guess?

  Mental Model and Algorithm:
    Make a new array
    Add both arrays to new array
    flatten, uniq, sort

=end

def merge(array_1, array_2)
  new_array = array_1 + array_2
  new_array.flatten.uniq.sort
end

def merge2(array_1, array_2)
  array_1 | array_2
end

p merge([1, 3, 5], [3, 6, 9])# == [1, 3, 5, 6, 9]
