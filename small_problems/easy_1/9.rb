# Sum of Digits

require 'pry'

def sum(num)
  arr = []
  loop do
    arr << (num % 10)
    num /= 10
    break if num < 1
  end

  arr.sum
end

def sum_no_loop(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end


puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

p sum_no_loop(23)
p sum_no_loop(496)
p sum_no_loop(123_456_789)