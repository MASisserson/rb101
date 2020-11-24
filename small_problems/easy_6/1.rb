# Cute Angles

=begin
PROBLEM
  input: float between 0 and 360
  output: string displaying degrees, minutes, and seconds

  Domain: Degrees are equivalent to hours here.

  Requirements:
    1. Both 0 and 360 degrees are appropriate.
    2. Has to be formatted just right.
  
  Mental Model:
    The program takes a degree quantity and converts it into 
    minutes and seconds. Each step can be isolated on its way down
    via divmod.

=end

# DEGREE = "\xC2\xB0"
# SEC_PER_DEG = (60 * 60)
# MIN_PER_DEG = 60.0
# SEC_PER_MIN = 60.0

# def dms(number)
#   degrees, minutes = number.divmod(1)
#   minutes *= 60
#   minutes, seconds = minutes.divmod(1)
#   seconds = (seconds * 60.0).floor
  
#   %Q{#{degrees}#{DEGREE}#{format("%02d", minutes)}'#{format("%02d", seconds)}"}
# end

require 'pry'

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE
MAX_DEGREES = 360

def dms(degrees_float)
  experiment = degrees_float % MAX_DEGREES
  total_seconds = (experiment * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  # binding.pry
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
puts dms(400) == %(40°00'00")
puts dms(-40) == %(320°00'00")
puts dms(-420) == %(300°00'00")
