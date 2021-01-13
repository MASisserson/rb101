# Question 5

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.bsearch_index { |x| x.start_with? 'Be' }
