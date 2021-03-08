# scramble

=begin
Write a function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise, return false.

inputs: 2 strings
outputs: none
return: true or false boolean

Rules:
1. There can be extra letters in string 1, but not in string 2
2. They have to be the same letters, not just the same number of letters
3. Doesn't matter the initial order of the letters in either string
4. What matters is that string1 has the same number of the same letters as string 2
5. Only working with alphabet characters
6. All lowercase

Mental Model: 
Check to see if string 1 has within it all the same letters in the same quantities as string 2
It does not matter if there are additional letters in string 1.

High Level Algorithm:
Determine the number of each letter in string 2. Check string 1 to see if it also has at least that number of each letter.
Return true if it does.
Return false if it does not.

Problem:
1. How to determine and record the number of each letter in string 2
  Create an alphabet hash that is populated by the number of entries of a letter in string 2
    Either by iteration or some other means
  Compare the non-zero values of that hash to the number of each letter in string1.


  Cycle through the alphabet and create a hash as we go
=end

def scramble(string1, string2)
  needed_letters = Hash.new

  ('a'..'z').each do |letter|
    needed_letters[letter] = string2.count letter
  end

  needed_letters = needed_letters.select do |key, value|
      value > 0
  end

  needed_letters.each do |letter, quantity|
    return false if (string1.count letter) < quantity
  end
  
  true
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true
