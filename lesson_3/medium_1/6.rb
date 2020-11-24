# Question 6

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# I would assume this will print 42. If not then "50 - 8"
# Okay, I feel dumb. It's fine. This is printing asnwer, not new_answer. 
# The resulting print is 34
