# Multiply Lists

def multiply_list(arr1, arr2)
  product = []
  arr1.each_index { |index| product << arr1[index] * arr2[index] }
  product
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
