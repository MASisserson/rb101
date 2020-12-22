# Question 1

# Process
# use #each_with_object

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

p (0..4).each_with_object({}) { |index, hsh| hsh[flintstones[index]] = index }
