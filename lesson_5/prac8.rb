# Practice Problem 8

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

def print_vowels(string_set)
  string_set.each_pair do |key, array|
    array.each do |string|
      string.chars.each do |letter|
        vowels = %w(A a E e I i O o U u)
        puts letter if vowels.include? letter
      end
    end
  end
end

print_vowels(hsh)
