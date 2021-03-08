# Lettercase Percentage Ratio

=begin

input: string
output:
return: hash with 3 keys (symbolss), each with an integer value

Rules:
1. neither includes spaces, numbers, and any non alphabetic character (an else case)
2. 

Mental Model:
The method should take a string, determine how many characters in tehs tring fall into the following catagories:
lowercase
uppercase
neither
and then return its findings in a hash.

High level Plan:
1. Have to iterate through the string
2. For each character, determine if it is currently uppercase, currently lowercase, or neither
3. Tally results to variables made in the method: lowercase, uppercase, neither
4. Return a hash with the results converted into percentages

=end


def letter_percentages(string)
  lowercase = 0.0
  uppercase = 0.0
  neither = 0.0
  string.each_char do |char|
    if char.upcase == char && char.downcase == char
      neither += 1
    elsif char.downcase == char
      lowercase += 1
    else
      uppercase += 1
    end
  end

  l_perc = ((lowercase / string.size) * 100).round(2)
  u_perc = ((uppercase / string.size) * 100).round(2)
  n_perc = ((neither / string.size) * 100).round(2)

  { lowercase: l_perc, uppercase: u_perc, neither: n_perc }
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
p letter_percentages('abdcefGHI') == {:lowercase=>66.67, :uppercase=>33.33, :neither=>0.0 }
