# Running Totals

=begin
use long form reduce to create another array
=end

# def running_total(array)
#   return array if array.empty?
  
#   new_array = []
#   new_array << array.reduce do |memo, num|
#                  new_array << memo
#                  memo += num
#                end

#   new_array.uniq
# end

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# Final Thoughts
# Couldn't figure out how to use #reduce to make something shorter than #map
