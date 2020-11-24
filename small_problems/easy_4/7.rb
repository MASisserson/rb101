# Convert a String to a Signed Number

=begin
MENTAL MODEL
Add if statement to skip loop once if sign in front.
Add if statement at end to multiply by sign if negative.
=end

DIGITS = { '1' => 1, '2' => 2, '3' => 3, '4' => 4,
           '5' => 5, '6' => 6, '7' => 7, '8' => 8,
           '9' => 9, '0' => 0 }

SIGNS = [ '-', '+' ]

def string_to_signed_integer(string)
  integer = 0
  for i in 0..(string.size - 1)
    next if SIGNS.include?(string[i])

    integer *= 10
    integer += DIGITS[string[i]]
  end

  integer *= -1 if (SIGNS[0] == string[0])

  integer
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
