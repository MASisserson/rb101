# Next Featured Number Higher than a Given Value

=begin

Featured Number
1. odd
2. Multiple of 7
3. Digits occur exactly once each

Mental Model:
Check and increment variable until variable is a featured number. Return the number


1. Have a way to test numbers to see if featured (method)
2. Have a variable to increment
3. Return the final number

Featured number method:
1. check if odd, multiple of 7
2. Digits occur exactly once each
    integer.digits.uniq == integer.digits

=end

def featured_number?(integer)
  return true if integer.odd? && (integer % 7 == 0) && (integer.digits.uniq == integer.digits)
  false
end

def featured(integer)
  number = integer
  loop do
    number += 1
    break if featured_number?(number) || number > 9_999_999_999
  end

  return "There is no possible number that fulfills those requirements" if number > 9_999_999_999
  number
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
