# Countdown

def count_down(integer)
  integer.downto 1 do |count|
    puts count
  end
end

count_down(10)

puts 'LAUNCH!'
