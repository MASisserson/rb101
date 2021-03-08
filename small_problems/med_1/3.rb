# Rotation (Part 3)

=begin

Thoughts:
1. Initialize a `count` variable that equals the number of digits in the argument `integer`
2. Create a copy of `integer` for safety called `rotated_int`
3. Loop `until` count == 0
  1. Reassign `rotated_int` to the return value  of `rotate_rightmost_digits`
  2. Reduce count by 1 
4. Return `rotated_int`

=end

def rotate_rightmost_digits(number, count)
  array = number.digits.reverse
  (array << array.delete_at(-count)).join.to_i
end

def max_rotation(integer)
  count = integer.digits.size
  rotated_int = integer.dup
  until count == 0
    rotated_int = rotate_rightmost_digits(rotated_int, count)
    count -= 1
  end
  rotated_int
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
