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
    Make one array that is the second cut, using negative size halved.
    Make a second array that is the first cut of the remainder.
    Join the two as arrays using each or something.
    Cut the arrays by transplanting size / 2 times. Takes advantage of 0 start.

  Algorithm:
    index = 0
    array_1
    array_2
    (origin.size / 2).times do
      array_1 << origin[index]
      index += 1
    end

    until index = origin.size do
      array_2 << origin[index]
      index += 1
    end

    join the two arrays

=end


# def halvsies(origin)
#   case origin.size.odd?
#   when true  then cut = (origin.size / 2)
#   when false then cut = (origin.size / 2) - 1
#   end

#   array_1 = []
#   for i in 0..cut
#     array_1 << origin[i]
#   end

#   array_2 = []
#   for i in (cut + 1)..(origin.size - 1)
#     array_2 << origin[i]
#   end

#   final = []
#   final[0], final[1] = array_1, array_2
# end

def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half  = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
