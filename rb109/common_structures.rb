# Reverse an array without using the build reverse method

def reverse(array)
  reversed_arr = []
  (array.size - 1).downto(0) do |index|
    reversed_arr << array[index]
  end

  reversed_arr
end

p reverse([1, 2, 3, 4, 5]) == [5, 4, 3, 2, 1]

# select the element out of the array if its index is a fibonacci number

def build_fib_seq(n)
  fib = [1, 1]
  count = 2
  until count >= n
    fib << fib[-1] + fib[-2]
    count += 1
  end

  fib
end

p sequence = build_fib_seq(20)

p arr = (0..100).to_a

new_arr = []
arr.each_with_index do |element, index|
  new_arr << element if sequence.include? index
end
p new_arr

# Write a method to determine if a word is a palindrome without using the reverse method

def reverse_array(array)
  reversed_arr = []
  (array.size - 1).downto(0) do |index|
    reversed_arr << array[index]
  end

  reversed_arr
end

def palindrome?(string)
  string == reverse_array(string.chars).join
end

p palindrome?('joy')
p palindrome?('1221')
p palindrome?('121')
p palindrome?('forof')

# How to create a fibonacci sequence
  # Create three variables: n, first, and last. Proceed through the sequence until n is the value you desire.
  # OR
  # Create an array starting with [1, 1] and build from there, knowing that the index is n and each the next number is equal to the last + second_to_last

# How to find all substrings in a string
  # use a two level iteration, the first level tracking the first character, the second level tracking the last_character. Dump the range between each into a new array.


# How to find if a string is a palindrome
  # do: string == string.reverse

# How to find anagrams in an array of strings
  # Initialize a hash 
  # Iterate through the array of strings doing:
    # Start a conditional, if no key equaling the string.chars.sort, create a key with that and add the string as a value. Else, add the string as a value of the found key.

# How to determine if something is prime
  # How to find if something is prime
    # require 'prime' 
    # write a method that calls a for loop which runs i from 2 to, but not including, the number in question
      # If the number % i ever == 0 return false
      # If you get through all that and never return false, return true

require 'prime'

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

p (3.5).prime?
# p primes_arr = arr.select do |element|
#                  element.prime
#                end
