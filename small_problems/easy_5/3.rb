# After midnight (Part 2)

=begin
PLAN
Cut string apart at ':'. Convert both slices to integers.
Multiply first slice by 60. Add to second slice.
after_midnight = result + 0
before_midnight = 1440 - 0 with caveatte for 0
=end

def as_minutes(military_time)
  hours_minutes = military_time.split(':').map(&:to_i)
  total_minutes = (hours_minutes[0] * 60) + hours_minutes[1]
end

def after_midnight(military_time)
  return 0 if military_time == '24:00'
  as_minutes(military_time)
end

def before_midnight(military_time)
  return 0 if military_time == '00:00'
  1440 - as_minutes(military_time)
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
