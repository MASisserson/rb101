# Question 2

# puts "the value of 40 + 2 is " + (40 + 2)

# I imagine the error will be caused by ruby's inability to implicitly
# convert integers into a string for output.
# The two following lines could replace the above line.

puts "the value of 40 + 2 is #{40 + 2}"

puts "the value of 40 + 2 is " + (40 + 2).to_s
