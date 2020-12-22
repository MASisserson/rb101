# Testing doc for lesson

def select_fruit(hash)
  hash.select { |key, value| value == 'Fruit' }
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

def double_numbers!(array)
  for i in 0..(array.size - 1)
    array[i] = array[i] * 2
  end
  array
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
p my_numbers

def multiply!(array, multiplier)
  for i in 0..(array.size - 1)
    array[i] = array[i] * multiplier
  end
  array
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply!(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
