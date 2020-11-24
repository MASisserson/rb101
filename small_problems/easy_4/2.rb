# What Century is That?

=begin

MENTAL MODEL:



create a hash with appropriate suffixes as keys for each final number (value)
reference this hash to attach proper suffix.

ALGORITHM:
number = (number.to_f) / 100
number.ceil

reference hash

=end

def century(year)
  cent = (year.to_f / 100).ceil.to_i

  case (cent % 10)
  when 0
    return "#{cent}th"
  when 1
    return "#{cent}th" if (cent % 100 == 11) 
    return "#{cent}st"
  when 2
    return "#{cent}th" if (cent % 100 == 12)
    return "#{cent}nd"
  when 3
    return "#{cent}th" if (cent % 100 == 13)
    return "#{cent}rd"
  when 4..9
    return "#{cent}th"
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'


# Final Thoughts:
# This work would need lots of refactoring to look legible enough. It works, though.
