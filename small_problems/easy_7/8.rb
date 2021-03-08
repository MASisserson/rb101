# Multiply Lists

def multiply_list(arr1, arr2)
  index = 0
  result = []
  until index == arr1.size
    result << arr1[index] * arr2[index]
    index += 1
  end
  result
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
