# Print While

numbers = []
(0..99).each { |x| numbers << x }

5.times do
  puts numbers.sample
end
