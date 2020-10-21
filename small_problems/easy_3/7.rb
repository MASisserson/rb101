# Odd Lists

def oddities(array)
  count = 0
  odd_elements = []
  unless array.empty?
    loop do
      odd_elements << array[count]
      count += 2
      break if count >= array.size
    end
  end
  odd_elements
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

def evenities(array)
  count = 1
  even_elements = []
  while count <= array.size
    even_elements << array[count]
    count += 2
  end
  even_elements
end
