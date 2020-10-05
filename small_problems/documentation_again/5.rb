# Multiple Signatures

a = %w(a b c d e)
puts a.fetch(7)
puts a.fetch(7, 'beats me')
puts a.fetch(7) { |index| index**2 }

# Error message because index is out of bounds
# 'beats me' because 7 is out of bounds. 'beats me' is the default.
# 7 is out of bounds so it runs the block. Thus output will be 49