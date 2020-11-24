# Fibonacci Number Location By Length

=begin

PEDAC
  Input: integer
  Output: integer

  Requirements: 
    A method of determining the number of digits in the new_element
      #to_s#size
    A way to add elements to the fibonacci_sequence
      record 3 values: no_1, no_2, index
    A way to return the index of the final element.
      Return statement

  Mental Model:
    Establish starting numbers: 1, 1
    Establish starting index: 2
    loop the addition of starting numbers and number replacements
    break loop when number size is greater than or equal to argument
    return index

  Data Structure: n/a

  Algorithm:
    no 1 = 1
    no 2 = 1
    index = 2

    LOOP
      add numbers together
      increment index
      rotate values forward
      check number 2 size, break if needed

    return number 2

=end

# def digits(integer)
#   count = 0
#   while integer > 0
#     count += 1
#     integer /= 10
#   end

#   count
# end

# def find_fibonacci_index_by_length(argument)
#   fibonacci_sequence = [1, 1]
#   loop do
#     new_element = fibonacci_sequence[-2] + fibonacci_sequence[-1]
#     fibonacci_sequence.push(new_element)
#     if digits(new_element) >= argument
#       return (fibonacci_sequence.index(new_element) + 1)
#     end
#   end
# end

def find_fibonacci_index_by_length(argument)
  no_1 = 1
  no_2 = 1
  index = 2

  loop do
    sum = no_1 + no_2
    index += 1
    no_1 = no_2
    no_2 = sum

    break if sum.to_s.size >= argument
  end

  index
end

p find_fibonacci_index_by_length(2)# == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3)# == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10)# == 45
p find_fibonacci_index_by_length(100)# == 476
p find_fibonacci_index_by_length(1000)# == 4782
p find_fibonacci_index_by_length(10000)# == 47847
