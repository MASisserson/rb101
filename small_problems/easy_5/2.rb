# After Midnight (Part 1)

=begin
GOAL
convert minutes (integer) to military time (string)

PLAN
Divide by 60 and take remainder.
Dividend is added to 0 or subtracted from 24 based on original value (+ or -).
Remainder is added to 0 or subtracted from 60 based on original value (+ or -).
convert both to a string and use Kernal#format to add a 0 when necessary.
return the following:
hours + ':' + minutes

=end

# def determine_hour(minutes)
#   hours = (minutes / 60).remainder(24)
#   if minutes < 0
#     if (24 + hours) == 24
#       0
#     else
#       24 + hours
#     end
#   else
#     0 + hours
#   end
# end

# def determine_minute(minutes)
#   military_minutes = minutes.remainder(60)
#   if minutes < 0
#     if (60 + military_minutes) == 24
#       0
#     else
#       60 + military_minutes
#     end
#   else
#     0 + military_minutes
#   end
# end

# def time_of_day(minutes)
#   hour = determine_hour(minutes)
#   minute = determine_minute(minutes)

#   return "#{format("%.2d", hour)}:#{format("%.2d", minute)}"
# end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(delta_minutes)
  delta_minutes =  delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

p time_of_day(0)
p time_of_day(-3)
p time_of_day(35)
p time_of_day(-1437)
p time_of_day(3000)
p time_of_day(800)
p time_of_day(-4231)

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
