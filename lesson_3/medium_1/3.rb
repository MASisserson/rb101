# Question 3

# def factors(number)
#   divisor = number
#   factors = []
#   begin
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end until divisor == 0
#   factors
# end

def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# number % divisor == 0 is there to show that the divisor is an integer

# line 10 is there to return the array of factors.

p factors(30)
p factors(0)
p factors(-10)
