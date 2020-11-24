# Spin Me Around in Circles

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

# strings are mutable, and the destructive #reverse is used here.
# I assume that the object will be the same object.

# And I would be wrong. Need to listen to my hunches. If you convert a string
# into an array, the original object is lost.
# Conversion means different objects. Even if both types of objects are mutable.
