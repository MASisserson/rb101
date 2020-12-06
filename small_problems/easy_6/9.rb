# Does My List Include This?

=begin
 
=end

def include?(array, integer)
  array.each { |x| return true if integer == x }
  return false
end

def include?(array, integer)
  !!array.find_index(integer)
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
