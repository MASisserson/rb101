# Practice Problem 5

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

male_munsters = munsters.select { |k,v| v['gender'] == 'male' }
accumulated_male_age = 0
male_munsters.each { |k,v| accumulated_male_age += v['age'] }
p accumulated_male_age
