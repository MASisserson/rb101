# Practice Problem 6

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def print_family(family)
  member_names = family.keys
  member_names.each do |name|
    puts "#{name} is a #{family[name]['age']}-year-old #{family[name]['gender']}."
  end
end

print_family(munsters)
