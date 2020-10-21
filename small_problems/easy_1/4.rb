# How Many?

def count_occurrences(vehicles)
  hash = Hash.new
  vehicles.each do |x|
    if hash[x] == nil
      hash[x] = 1
    else
      hash[x] += 1
    end
  end

  hash.each { |k,v| puts "#{k} => #{v}"}

end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)