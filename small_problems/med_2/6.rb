# Tri-Angles

=begin

input: 3 integers
return: one of 4 symbols

Rules:
1. Valid if
  1. Sum of integers  == 180
  2. All angles > 0
2. right: One integer == 90
3. obtuse: One integer > 90
4. acute: all others

=end

def triangle(a, b, c)
  angles = [a, b, c]

  case
  when angles.sum != 180 || angles.min <= 0
    :invalid
  when angles.max == 90
    :right
  when angles.max > 90
    :obtuse
  else
    :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
