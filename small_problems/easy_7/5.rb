# Staggered Caps

=begin

1. Take a string and return a new string with caps every other character. Include
   numbers in character counting.
2. Make everything in the string lowercase, then count through the string and
   make every other letter starting with the first capitalized.
3. Convert string to array with #chars
   Iterate thru array with #map
   Keep count with a count variable outside of the loop
   #upcase and #downcase works for integer numbers in the way intended
   #downcase whole string to begin with

=end

def staggered_case(string)
  count = 1
  string_chars = string.downcase.chars
  result = String.new
  for i in 0..(string.size-1)
    result << string_chars[i].upcase if (i+1).odd?
    result << string_chars[i]        if (i+1).even?
  end
  result
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
