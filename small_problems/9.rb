# Multiply All Pairs

def multiply_all_pairs(arr1, arr2)
  product = Array.new
  arr1.each do |integer1|
    arr2.each { |integer2| product << integer1 * integer2 }
  end
  product.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
