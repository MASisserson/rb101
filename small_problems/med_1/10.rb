# Fibonacci Numbers (Last Digits)

=begin

input: integer
output: none
return: integer

Rules
1. Must be solved without recursion for computational purposes
2. Must only return the final digit in the nth element in the fibonacci sequence

Mental Model
1. Determine the nth element in the fibonacci sequence
  1. Assign two variables, first and last, to the 2 segments of the sequence we need to keep track of.
  2. Loop 
    1. A number of times equal to n - 2
    2. Reassign first and last to [last, (first + last) ]
2. Determine the final integer in that element
  1. element % 10
3. Return that integer

=end

def fibonacci_last(n)
  first, last = [1, 1]
  (n-2).times { first, last = [ last, (first + last) % 10 ] }
  last % 10
end

p fibonacci_last(15)        # -> 0 (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
# p fibonacci_last(123456789987745) # -> 5
