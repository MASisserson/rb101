# Test

def mutation_test(something)
  p something
  p something.object_id
  something[0] = 4
  p something
  p something.object_id
end

array = [1, 2, 3, 4]
mutation_test(array)
p array
