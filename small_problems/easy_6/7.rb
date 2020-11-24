# Halvsies

=begin

PEDAC
  Input: array
  Output: 1 nested array

  Requirements:
    Splits down the middle favor the first half
    Elements and arrays in same order as original array.
    Nondestructive
    Returns 2 arrays even if one or both would be empty

  Mental Model:
    Make one array that is the first cut.
    Make a second array that is the second cut.
    Join the two as arrays using each or something.

  Algorithm:
    

=end


def halvsies()

end

halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]
