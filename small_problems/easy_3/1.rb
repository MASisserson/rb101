# Searching 101

# Algorithm:
# Make method that sends message
# Write 5 messages
# add user input to array
# Add final request for number
# if statement based on boolean from array search

def message(string)
  puts "==> #{string}"
end

array = []
message 'Enter the 1st number:'
array << gets.chomp.to_i

message 'Enter the 2nd number:'
array << gets.chomp.to_i

message 'Enter the 3rd number:'
array << gets.chomp.to_i

message 'Enter the 4th number:'
array << gets.chomp.to_i

message 'Enter the 5th number:'
array << gets.chomp.to_i

message 'Enter the last number:'
number = gets.chomp.to_i

if array.bsearch { |x| x == number }
  puts "The number #{number} appears in #{array}."
else
  puts "The number #{number} does not appear in #{array}."
end


# Test cases:
# 0, -1, 12345

# Final Thoughts:
# I should have just used the #include? method. Also, the array could have been
# better named.
