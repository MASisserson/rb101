# Question 3

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

=begin

The string is not going to come out different. '+=' is reassignment. That reassignment is only happening to the copy variable used in the method. OG object is unaffected.
The array is going to be ['pumpkins', 'rutabaga']. '<<' is mutating. The original array object is going to be affected by that, even within a method.

=end
