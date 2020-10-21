# Sum or Product of Consecutive Integers

def message(string)
  puts ">> #{string}"
end

def validate_integer(input)
  input = input.to_s unless input.is_a? String
  if input.to_i > 0
    /\A[+-]?\d+\z/.match(input)
  else
    false
  end
end

integer = String.new
loop do
  message "Please enter an integer greater than 0:"
  integer = gets.chomp
  break if validate_integer(integer)
end

loop do
  message "Enter 's' to compute the sum. 'p' to compute the product."
  user_input = gets.chomp
  case user_input
  when 's'
    puts "The sum of the integers between 1 and #{integer.to_i} is
    #{(1..integer.to_i).sum}."
    break
  when 'p'
    puts "The product of integers between 1 and #{integer.to_i} is
    #{(1..integer.to_i).reduce(:*)}."
    break
  else
    puts "I don't know what to do with that response."
  end
end
