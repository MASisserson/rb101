# Arithmetic Integer

def message(string)
  puts "==> #{string}"
end

message 'Enter the first number:'
first_number = gets.chomp.to_f

message 'Enter the second number:'
second_number = gets.chomp.to_f

message "#{first_number} + #{second_number} = #{first_number + second_number}"
message "#{first_number} - #{second_number} = #{first_number - second_number}"
message "#{first_number} * #{second_number} = #{first_number * second_number}"
message "#{first_number} / #{second_number} = #{first_number / second_number}"
message "#{first_number} % #{second_number} = #{first_number % second_number}"
message "#{first_number} ** #{second_number} = #{first_number**second_number}"


# Final Thoughts:
# No big.
