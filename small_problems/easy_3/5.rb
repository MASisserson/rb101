# Squaring an Argument

def multiply(x, y)
  x * y
end

def square(n, power)
  total = 1
  power.times do
    total = multiply(total, n)
  end
  total
end

puts square(5, 3)
puts square(8, 2)


# Final Thoughts:
# There was a second there where I forgot about returning rules. 
# I have to remember that the method returns the last computation.
# #times returns the caller, not the stuff in the block
