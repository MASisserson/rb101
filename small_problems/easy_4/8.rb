# Exercise 8

=begin
ALGORITHM
1. Create reference array of string integers 
2. Cut down integer via %10 & /10 into a string
3. Reverse string
=end

STRING_INTEGERS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(integer)
  return '0' if integer == 0
  
  string = String.new
  while integer >= 1 do
    index = integer % 10
    string << STRING_INTEGERS[index]
    integer /= 10
  end
  
  string.reverse
end

p integer_to_string(4321)

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
