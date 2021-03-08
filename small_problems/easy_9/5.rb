# Uppercase Check

def uppercase?(string)
  char_arr = string.chars
  char_arr.each { |character| return false if character =~ /[a-z]/ }
  true
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
