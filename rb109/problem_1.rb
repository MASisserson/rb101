=begin
Given a divisor and a bound, find the largest number N such that:
N is divisible by the divisor
N is less than or equal to the bound
N is greater than 0.


input: 2 integers: divisor and bound
output: integer

Rules:
1. In all cases, result is in between the two numbers given as arguments
2. Has to be between 1 and the bound, inclusive.

Mental Model:
Starting from the bound, count down. Return the first value that can be divided evenly by the divisor.

High Level Plan:
1. Count down from the bound.
2. Check if the integer is evenly divisible by the divisor
  1. If yes, return the number
  2. If no, continue on to next iteration
Return nil if nothing found


=end

def maxMultiple(divisor, bound)
  bound.downto(1) do |integer|
    return integer if integer % divisor == 0
  end
  nil
end


p maxMultiple(2, 7) === 6
p maxMultiple(3, 10) === 9
p maxMultiple(7, 17) === 14
p maxMultiple(10, 50) === 50
p maxMultiple(37, 200) === 185
p maxMultiple(7, 100) === 98
