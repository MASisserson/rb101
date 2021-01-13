# Question 10

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

=begin

Problem
1. Need to isolate the age of the family member
2. Compare it to certain age ranges and based on the comparison, assign a new 'age_group' key, value pair to the family member's value

=end

def age_group(family)
  family.map do |family_member, information|
    if information['age'] >= 100
      family[family_member]['age_group'] = 'senior'
    elsif information['age'] <= 100 && information['age'] >= 20
      family[family_member]['age_group'] = 'adult'
    else
      family[family_member]['age_group'] = 'kid'
    end
  end

  family
end

p age_group(munsters) == { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
                          "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
                          "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
                          "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
                          "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
