# When will I Retire?

print "What is your age? "
age = gets.chomp.to_i
print "At what age would like to retire? "
retire = gets.chomp.to_i

year = Time.now.year
remaining_work_years = retire - age
retire_year = year + remaining_work_years

puts "It's #{year}. You will retire in #{retire_year}."
puts "You have only #{remaining_work_years} years of work to go."
