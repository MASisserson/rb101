# Question 5

def tricky_method(param)
  a_string_param += "rutabaga"
end

def tricky_method!(param)
  param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
