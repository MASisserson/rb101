# Question 4

def youngest(family)
  youngest_age = family.values.sort[0]
  member = family.select { |k,v| v == youngest_age }
  member.keys
end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p youngest(ages)
