# Tip Calculator

print 'What is the bill? '
bill = gets.chomp.to_f
print 'What is the tip percentage? '
percent = gets.chomp.to_f

tip = bill * (percent / 100)
total = tip + bill
puts "The tip is $#{format("%.2f", tip)}"
puts "The total is $#{format("%.2f", total)}"
