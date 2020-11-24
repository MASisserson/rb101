# Convert a String to a Number!

=begin
MENTAL MODEL
Separate each element of the string from the front and convert each element
to a corresponding integer. Add these integers into a growing final integer
that will be outputted.
=end

def string_to_integer(string)
  digits = { '1' => 1, '2' => 2, '3' => 3, '4' => 4,
             '5' => 5, '6' => 6, '7' => 7, '8' => 8,
             '9' => 9, '0' => 0 }
  
  integer = 0
  for i in 0..(string.size - 1)
    number_letter = string[i]
    integer *= 10
    integer += digits[number_letter]
  end

  integer
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
