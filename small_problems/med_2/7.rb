# Unlucky Days

=begin

input: integer > 1752
return: integer

Rules:


Mental Model:

I just need to initialize a date on Jan 13 of the requested year
Check if it is Friday, tallying a counter if it is
Cycle through all months of the year.
Return the counter

=end

require 'date'

def friday_13th(year)
  tally = 0
  date = Date.civil(year, 1, 13)
  loop do 
    tally += 1 if date.friday?
    break if date.month == 12
    date = date >> 1
  end
  tally
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
