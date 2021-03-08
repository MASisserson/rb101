# Double Doubles

require 'pry'

def is_double_number?(number)
  return false if number.digits.size == 1
  dig_arr = number.digits
  first_half = dig_arr.slice(0..(dig_arr.size/2 - 1))
  second_half = dig_arr.slice((dig_arr.size/2)..(dig_arr.size - 1))
  true if first_half == second_half
end

def twice(number)
  case !!is_double_number?(number)
  when true  then number
  when false then number*2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
