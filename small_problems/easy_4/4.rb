# Multiples of 3 and 5

=begin
iterate from 1 to number given
  add to array if divisble by 3 or 5
  sum array elements together via reduce if necessary
=end

def multisum(number)
  multiples = (1..number).select { |x| (x % 3 == 0) || (x % 5 == 0) }
  multiples.reduce(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
