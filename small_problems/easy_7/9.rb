# Multiply All Pairs

def multiply_all_pairs(arr1, arr2)
  result = Array.new
  arr1.each do |number1|
    arr2.each do |number2|
      result << number1 * number2
    end
  end
  result.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
