# Delete Vowels

=begin

PEDAC
  input: array of strings
  output array without vowels

  Requirements: 
    an array must be returned, elements split by spaces
    deletion has to happen after array splitting

  Mental Model:
    iterate through array, deleting vowels

  Examples:
    If I were doing this on my own, I probably would include an example without
    any vowels and one with only vowels

  Data Structure:
    Nothing for sorting. Final has to be in array form.

  Algorithm:
    Method definition
      ITERATE through array, DELETING vowels
      RETURN array

=end

def remove_vowels(array)
  array.map { |string| string.delete("AEIOUaeiou") }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# Final Thoughts: I actually found this one easy
# Gotta remember to pay attention to input types, though.
