# Combine Two Lists

# def interleave(arr1, arr2)
#   arr1.zip(arr2).flatten
# end

def interleave!(arr1, arr2)
  interleaved_array = Array.new
  loop do
    break if arr1.empty? && arr2.empty?

    interleaved_array << arr2.pop
    interleaved_array << arr1.pop
  end

  interleaved_array.reverse
end

def interleave(arr1, arr2)
  interleaved_array = Array.new
  for i in 0..(arr1.size - 1) do
    interleaved_array << arr1[i]
    interleaved_array << arr2[i]
  end

  interleaved_array
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

arr1 = [1, 2, 3]
arr2 = %w(a b c)

p interleave(arr1, arr2)
p arr1
p arr2
