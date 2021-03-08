=begin
Write a method that will return a substring based on specified indices.

input: string, 2 integers (start_index, end_index)
output: string (substring)

Rules:
1. Only one index may be given, in which case just that index should be returned
2. 

Mental Model:
Create a method that returns a specific substring starting at the first integer
and ending on the last integer.


=end

def substring(string, start_index, end_index=start_index)
  string[start_index..end_index]
end

p substring("honey", 0, 2) == "hon"
p substring("honey", 1, 2) == "on"
p substring("honey", 3, 9) == "ey"
p substring("honey", 2) == "n"
