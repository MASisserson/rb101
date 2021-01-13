# Practice Problem 10

array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

def increment(array, increment)
  array.map do |sub_hash|
    sub_hash.each_with_object({}) { |(k,v), h| h[k] = (v + 1) }
  end
end

p increment(array, 1)
p array
