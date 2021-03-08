# Substring Test

=begin
Given 2 strings, your job is to find out if there is a substring that appears in both strings. You will return true if you find a substring that appears in both strings, and false if not. 
A substring is longer than 1 character.

PEDAC

Input: Two strings
Return: true or false boolean
Output: none

Mental Model:
If there is a substring in both strings (longer than 1 character), return true
If not, return false

Rules:
1. Counts spaces and numbers
2. Does not take capitalization into account
3. The substrings must be longer than one character

To Keep in Mind:
1. Strings have index values for each eleemnt
2. They are collections

High Level Plan
1. Create substrings of each argument, and store them in an array as lowercase versions
2. Iterate through one array, and check if any element is contained in the other array
3. Return true if ever this is the case
4. Return false otherwise

How to create substrings:
S o m e t h i n g
0 1 2 3 4 5 6 7 8
Iterations:
0 1
1 2
2 3
3 4
4 5
5 6
6 7
7 8
0 1 2
etc.

substring_arr = []

0.upto(string.size - 2) do |start_index|
  (start_index+1).upto(string.size - 1) do |final_index|
    substring_arr << string[start_index..final_index]
  end
end

=end


def get_substrings(string)
  substring_arr = []

  0.upto(string.size - 2) do |start_index|
    (start_index+1).upto(string.size - 1) do |final_index|
      substring_arr << string[start_index..final_index].downcase
    end
  end

  substring_arr
end

def substring_test(string_1, string_2)
  substrings_1 = get_substrings(string_1)
  substrings_2 = get_substrings(string_2)

  substrings_1.each do |substring|
    return true if substrings_2.include? substring
  end

  false
end

puts substring_test('Something', 'Fun') == false
puts substring_test('Something', 'Home') == true
puts substring_test('Something', ' ') == false
puts substring_test('BANANA', 'banana') == true
puts substring_test('test', 'llt') == false
puts substring_test(' ', ' ') == false
puts substring_test('1234567', '541265') == true
