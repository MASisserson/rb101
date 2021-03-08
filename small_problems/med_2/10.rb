# Sum Square - Square Sum

=begin

input: integer
return: integer

Mental Model:
Convert the argument into an array of numbers (method)
Compute over the array in two different ways (2 methods), saving each as variables
Subtract one from the other.

High Level Thoughts:
1. Convert the argument into an array of numbers (method)
    Make a copy of the integer
    Add the integer to the array
    Subtract 1 from the integer
    Repeat 2-3 until integer is 0, then stop
    Return the array
2. Sum Square
    sum the array elements
    square the result
3. Square Sum
    Iterate through the array elements
    Square the element and add it to a sum variable.
    Return the sum variable.
4. Subtract

=end

def convert(integer)
  to_be = integer
  array = Array.new
  until to_be == 0
    array << to_be
    to_be -= 1
  end

  array
end

def sum_square(array)
  array.sum ** 2
end

def square_sum(array)
  sum = 0
  array.each { |element| sum += element**2 }
  sum
end

def sum_square_difference(integer)
  array = convert(integer)
  first = sum_square(array)
  second = square_sum(array)
  first - second
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
