# Convert a Signed Number to a String!

STRING_INTEGERS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(integer)
  return '0' if integer == 0
  integer *= -1 if integer.negative?
  
  string = String.new
  while integer >= 1
    index = integer % 10
    string << STRING_INTEGERS[index]
    integer /= 10
  end
  
  string.reverse
end

# def signed_integer_to_string(integer)
#   if integer.positive?
#     ('+' << integer_to_string(integer))
#   elsif integer.negative?
#     ('-' << integer_to_string(integer))
#   else
#     integer_to_string(integer)
#   end
# end

def signed_integer_to_string(number)
  case number<=> 0
  when -1 then "-#{integer_to_string(number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end

p signed_integer_to_string(4321)
p signed_integer_to_string(-123)
p signed_integer_to_string(0)

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

=begin
Final Thoughts:
I should keep a couple things in mind:
1. <=> is good for checking where a number falls relative to zero.
2. I can design methods to take positive integers, and just feed them inverted
   negative integers when the time comes.
 
=end
