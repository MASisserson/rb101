# Now I Know My ABCs

=begin

input: string
return: boolean

Rules:
1. Two characters cannot borrow from the same pair of characters below within the same string.
i.e. BUTCH returns false because both U and H are present in the string and H:U make up a block pair

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

2. Case doesn't matter
3. No characters except alphabetical characters

Mental Model:
1. Based on a string, the method returns true if only one character in the string borrows from each block pair. False otherwise.

high level Plan:
1. Initializae a local variable array that contains all the block pairs as sub-arrays
1.5 Initialize another local array that is empty
2. Iterate through the string
    Iterate through the block pairs array, checking each array to see if it matches the character we are looking at (method)
    Return the block pair that contains the character we are looking at
    Pass that block pair to the other local array
3. compare the other local variable to itself with #uniq called on it. If the same, return true. If not, false.


Constant variable with block pairs

Main Method:
1. Initialize contained pairs array
2. Iterate through string characters
    Pass each character, and the contained_pairs array to add_pair!
    contained pairs will be mutated
3. Compair contained_pairs with contained_pairs.uniq


add_pair:
1. Select through BLOCK_PAIRS to find the pair that the character is present in

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

=end

BLOCK_PAIRS = [
  ['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
  ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
  ['V', 'I'], ['L', 'Y'], ['Z', 'M']
]

p check_quantity('BATCH')
p check_quantity('BUTCH')

def add_pair!(character, contained_pairs)
  contained_pairs << BLOCK_PAIRS.select { |pair| pair.include? character }
end

def block_word?(string)
  contained_pairs = []
  string.upcase.each_char { |char| add_pair!(char, contained_pairs) }
  contained_pairs == contained_pairs.uniq
end

# p block_word?('BATCH') == true
# p block_word?('BUTCH') == false
# p block_word?('jest') == true
