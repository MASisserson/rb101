# Odd Numbers

(1..99).each { |x| puts x if x % 2 == 1 }

# I kinda prefer this one now though:

puts (1..99).select { |n| n.odd? }

# Thank you Mustafa ILIKKAN
