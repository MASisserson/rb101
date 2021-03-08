# 1000 Lights

=begin

Mental Model:
  There are n lights. We go through n repetitions, with each repetition counting in multiples of n.
  Certain numbers will always be returned if n is greater than or equal to them: 1, 4, 9, (I presume the next to be 16)

Process:
  Imitate the process of going through the lights through iteration.
  For loop is ideal here because of the growing integer value that can be incremented in a range.
  I create an hash of integers from 1 to `n` ask keys. Values are either 'on' or 'off' (light_bulbs)
  I start a `for` loop that takes `i` from `1` to the given integer `n`
  The loop checks each key in `light_bulbs` that i covers and reverses the switch
  i is incremented within each loop via addition with itself
  Finally, create an array from the light_bulb keys that have 'on' as their value

Algorithm:
1. Initialize the `light_bulbs` hash with all values set to off

2. Initialize the for loop with a range (1..n)
3. Check hash at i key and reverse switch
4. increment i
5. Create array from hash keys

=end

require 'pry'

def lights_still_on(n)
  light_bulbs = Array.new
  n.times { |_| light_bulbs << false }
  
  start_bulb = 1
  loop do
    break if start_bulb > n
    light_bulbs.each_with_index do |value, index|
      light_bulbs[index] = !value if ((index + 1) % start_bulb == 0)
    end
    start_bulb += 1
  end

  bulb_count = Array.new
  light_bulbs.each_with_index { |value, index| bulb_count << (index + 1) if value }
  bulb_count
end

p lights_still_on(5) == [1, 4]
p lights_still_on(10) == [1, 4, 9]
p lights_still_on(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]
