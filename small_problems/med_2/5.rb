# Triangle Sides

=begin

input: 3 integers
return: one of 4 symbols

Rules:
1. To be a triangle:
  1. sum of 2 smallest integers must be greater than biggest integer
  2. all integers must be > 0
2. Returns are as follows:
  :invalid for breaking the above rule
  :equilateral for all 3 integers being equal
  :isosceles for 2 integers being equal, but 3rd is different
  :scalene for all 3 integers being different

Mental Model:
Run through the requirements in a series of if statements, returning the appropriate symbol at the right conditional branch

High Level:
0. Create array of sides to work with
1. Check :invalid
  1. Is any integer <= 0
  2. Sum smallest integers > largest integer?
2. Check :equilateral
  1. 1 == 2 == 3
3. Check :scalene
    1. 1 != 2 != 3
4. Check :isosceles (else)
  1. 1 == 2 != 3

=end

def triangle(a, b, c)
  tri = [a, b, c].sort

  if    tri[0..1].sum <= tri[2]                                  then :invalid
  elsif tri.any? { |side| side <= 0 }                            then :invalid
  elsif tri[0] == tri[1] && tri[1] == tri[2]                     then :equilateral
  elsif tri[0] != tri[1] && tri[0] != tri[2] && tri[1] != tri[2] then :scalene
  else                                                                :isosceles
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
