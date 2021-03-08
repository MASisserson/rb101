# Fibonacci Numbers (Recursion)

=begin

Input: Integer
Output: none
Return: Integer

Mental Model
Take an integer in and return the fibonacci number in sequence in that integer position.

Requirements:
1. Must use recursion
  a. Must call itself at least once
  b. Must posess a condition that stops the recursion
  c. Must use the result returned by themselves

Process:

n is the only variable that can be passed along

=end

# def sum(n)
#   return 1 if n == 1
#   n + sum(n - 1)
# end

# def fibonacci(number)
#   if number < 2
#     number
#   else
#     fibonacci(number - 1) + fibonacci(number - 2)
#   end
# end

# [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]

def fibonacci(n, fib1 = 1, fib2 = 1)
  return fib1 if n == 1
  fibonacci((n-1), fib2, (fib1 + fib2))
end

# def fibonacci(n)
#   count = 2
#   last_number = 1
#   second_last_number = 1
#   exchange = 1
#   return last_number if n == 1 || n == 2
#   loop do
#     exchange = last_number
#     last_number += second_last_number
#     second_last_number = exchange
#     count += 1
#     break if count >= n
#   end
#   last_number
# end

# def fibonacci(nth)
#   first, last = [1, 1]
#   3.upto(nth) do
#     first, last = [last, first + last]
#   end

#   last
# end

system 'clear'
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(800)
# p fibonacci(20) == 6765
# p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501
