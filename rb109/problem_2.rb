=begin

Problem Description
Given an array of strings, return a boolean indicating whether
at least three of the elements in the array have digits whose sum is
divisible by 3.

Elements of the argument array will be strings containing only string digits 0-9.

For example:
In the array ['35', '01110', '126', '57', '13'], 
the sum of the digits of each element will be: [8, 3, 9, 12, 4]
from the resulting sums, there are 3 that are evenly divisible by 3: [3, 9, 12]
so our function would return true.  See the below test cases for more examples.

input: array of strings
output: boolean

Mental Model:
Convert every number_string into a sum of the integers that are characters in the string.
Make a new array from the selection of the previous step's elements that are divisble by 3.
Check if that array's size is greater than or equal to 3

High Level Plan:
1. Create an array filled with the elements of the argument converted to sums of their integers.
    call a helper method that returns the intended array when passed the argument (sum_digits)
      2 levels of iteration
        1. Iterate through every element of the first array
           Initialize the sum_total variable
          1. Iterate through the element's characters, converting them to integers, and adding them to a counter (sum_total)
           Return the sum_total variable
2. Create a new array with only the elements from step one that are cleanly divisble by 3
3. Compare the size of this array to the integer 3

=end

def sum_digits(array)
  array.map do |number_string|
    sum_total = 0
    number_string.each_char do |integer_string|
      sum_total += integer_string.to_i
    end
    sum_total
  end
end

def threeByThree(array)
  digit_sums = sum_digits(array)
  divisible = digit_sums.select { |integer| integer % 3 == 0 }
  divisible.size >= 3
end

p threeByThree(['01112', '0111', '00030', '2043', '12043']) == true
p threeByThree(['01112', '2043', '12043']) == false
p threeByThree(['01112', '2043']) == false
p threeByThree(['93', '9', '1', '25', '1212']) == true
