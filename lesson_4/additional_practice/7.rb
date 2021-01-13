# Question 7

def letter_frequency(string)
  frequencies = Hash.new
  string_arr = string.chars
  string_arr.delete(' ')
  string_arr.each do |letter|
    if frequencies.keys.include? letter
      frequencies[letter] += 1
    else
      frequencies[letter] = 1
    end
  end

  frequencies
end

statement = "The Flintstones Rock"

p letter_frequency(statement)
