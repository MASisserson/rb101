# Stringy Strings

def stringy(integer)
  # number_string = []
  
  # loop do
  #   integer -= 1
  #   break if integer < 0
  #   if number_string.empty?
  #     number_string << '1'
  #   elsif number_string.last == '1'
  #     number_string << '0'
  #   else
  #     number_string << '1'
  #   end
  # end

  # number_string.join

  numbers = []

  integer.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end


puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'


# Commentary:
# The launch school code is shorter and simple. It is easy to read.
# I can create code like this if I take a moment to consider the purpose of
# every data point I have for use in the problem.