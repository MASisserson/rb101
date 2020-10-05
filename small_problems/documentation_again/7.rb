# Parent Class

s = 'abc'
puts s.public_methods.inspect

# The lesson here is that if a method works on a class, but that method
# is not visible in the documenation of that class, you should try looking
# at the documentation of the class's parent class.
# Additionally, if looking at a superclass's API, you have to be aware
# that a subclass you are using could be overriding the superclass's method.