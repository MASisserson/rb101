# Rotation (Part 2)

=begin

1. Convert number into array (#digits.reverse)
2. Use negative count to identify the midpoint to switch.
3. Array jazz to return correct value.

1. Convert number into array (#digits.revers)
2. use negative count to identify the mdipoint to switch.
3. append -count index value to end of array
4. Convert -count - 1 value to nil
5. Select for truthiness

=end

def rotate_rightmost_digits(number, count)
  array = number.digits.reverse
  (array << array.delete_at(-count)).join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
