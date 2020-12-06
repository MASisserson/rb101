# Right Triangles

=begin

PEDAC
  input: integer
  output: an image of a right triangle. Really, it is a box made of spaces and asterixes. 

  Requirements:
    The right angle of the triangle has to be made on the lower right of the box.

  Further Requirements:
    The right angle can be at any point in the box.

  Mental Model:
    Loop for integer times
    Stars equal 1 to begin
    Spaces equal integer - 1 at beginning
    puts the associated string
    Reduce spaces by 1, and increase stars by 1
    That should be it.

    I can get away with not having variables if I use a for loop

    Quadrants run from 1-4 (Upper left, upper right, lower left, lower right)
    I could fairly easily do a 4 branch case statement with a different for loop for each.
    

  Algorithm:
    See above

=end

def triangle(size, quadrant=4)
  case quadrant
  when 1
    for i in 0..size do
      puts "*" * (size - i) + " " * (i)
    end
  when 2
    for i in 0..size do
      puts " " * (i) + "*" * (size - i)
    end
  when 3
    for i in 0..size do
      puts "*" * (i) + " " * (size - i) 
    end
  when 4
    for i in 0..size do
      puts " " * (size - i) + "*" * (i) 
    end
  end
end

triangle(5, 1)
triangle(5, 2)
triangle(5, 3)
triangle(5, 4)
triangle(5)
triangle(9)
