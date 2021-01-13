# Practice Problem 9

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

def arrange_descending(array)
  array.map do |sub_array|
    sub_array.sort do |a,b|
      b <=> a
    end
  end
end

p arrange_descending(arr)
