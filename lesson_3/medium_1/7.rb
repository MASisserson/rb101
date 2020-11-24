# Question 7

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)
p munsters

# 2 reasons why it doesn't get ransacked. 
# 1. The data is kept in the program and is untouched after running the program.
# After running this program, the munsters hash above will remain unchanged.
# 2. The methods += and = are assigment operators that do not change values
# outside of the method.

=begin
Reason 1 still stands, this code file is not modified permanently by itself.
Reason 2 was wrong. []= is mutating. I forgot that.
=end
