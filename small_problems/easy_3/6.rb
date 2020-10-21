# Exclusive Or

# def xor?(v1, v2)
#   if v1 == true
#     if v2 == false
#       return true
#     elsif v2 == true
#       return false
#     end
#   elsif v1 == false
#     if v2 == true
#       return true
#     elsif v2 == false
#       return false
#     end
#   end
# end

def xor?(value1, value2)
  return true if value1 && !value2
  return true if value2 && !value1
  false
end

puts xor?(5.even?, 4.even?)  == true
puts xor?(5.odd?, 4.odd?)    == true
puts xor?(5.odd?, 4.even?)   == false
puts xor?(5.even?, 4.odd?)   == false

# Final Thoughts:
# I default to writing lengthy if else statemetns a lot. I should work on not
# doing that because it is hard to read.
# I did not realize that you could attach a '!' to the beginning of a value to 
# give it falsiness. It might only work if checking for falsiness.
# xor? is a short circuit operation in that multiple steps can be skipped
#   !value2 can be skipped if value1 is false
#   !value1 can be skipped if value1 is false
#   every part after the successful check is skipped (such as the false bit)
# Most cohesive true-false setups are likely to be short-circuit evaluations
# because they need to account for edge cases that will often not come up.
