# Question 4

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end

p dot_separated_ip_address?('4.5.5')
p dot_separated_ip_address?('1.2.3.4.5')
p dot_separated_ip_address?('1.2.3.4')
p dot_separated_ip_address?('1.260.2.3')
p dot_separated_ip_address?('-1.5.3.4')
p dot_separated_ip_address?('0.255.14.75')
