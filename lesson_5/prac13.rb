# Practice Problem 13

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

def rearrange(array)
  array.sort_by { |sub_array| sub_array.select { |integer| integer.odd? } }
end

p rearrange(arr) == [[1, 8, 3], [1, 6, 7], [1, 4, 9]]
