# loan_calculator.rb

# Inputs:
# 1. Loan amount
# 2. Annual Percentage Rate (APR)
# 3. Loan Duration

# Outputs:
# 1. Monthly interest rate
# 2. Loan duration in months
# 3. Monthly payment

# General Formula:
# m = p * (j / (1 - (1+j)**(-n)))
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months

# MENTAL MODEL
# The calculator requests user three pieces of user input and then asks what
# the user wants to know of the outputs. The user then can ask for another
# output or can ask to end the session. The system runs methods tied to each
# output in order to provide that output for the user.

# PROCESS (ALGORITHM)
# 1. Request and validate user Loan Amount (dollars)
# 2. Request and validate user APR (percentage)
# 3. Request and validate user loan duration (years)
# 4. Present options: (validation loop needed here too)
#     Monthly interest rate
#     Loan duration in months
#     Monthly payment
# 5. Output user request, then ask if there is anything else the user wishes
#    to know. If yes, repeat. If no, end session.

def valid?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end

def monthly_interest(apr)
  interest = apr.to_f / 12
  interest.round(2)
end

def monthly_payment(loan_amount, monthly_interest, months)
  payment = loan_amount.to_f * ((monthly_interest.to_f / 100) /
  (1 - (1 + (monthly_interest.to_f / 100))**(-months.to_f)))

  payment.round(2)
end

def message(string)
  puts "=> " + string
end

def another_loop?
  loop do
    message "Is there anything else you want to know? (y/n)"
    answer = gets.chomp
    if /^y$/i.match(answer) || /^[y][e][s]$/i.match(answer)
      return true
    elsif /^n$/i.match(answer) || /^[n][o]$/i.match(answer)
      return false
    else
      message "Please enter either \"yes\" or \"no\"."
    end
  end
end

loan_amount = String.new
message "Howdy! Please tell us some information about your loan to get started."
loop do # loan_amount request
  message "What is your total loan amount in U.S. dollars?"
  loan_amount = gets.chomp

  break if valid?(loan_amount)

  message "I'm sorry. We could not read that response."
  message "Please input your total loan amount in U.S. dollars. Please do not
   include additional characters in your input like $ or %. Also please do not
   include commas or periods."
end

apr = String.new
message "Excellent. Now please input your Annual Percentage Rate (APR)."
loop do # APR request
  message "Please input your APR as a percent value, but omit the % sign."
  apr = gets.chomp

  break if valid?(apr)

  message "I'm sorry. We could not read that response."
end

years = String.new
months = String.new
message "Thank you."
loop do # loan duration in years request
  message "Please input the loan's duration in years."
  years = gets.chomp
  months = years.to_i * 12

  break if valid?(years)

  message "I'm sorry. We could not read that response."
  message "Please input your Annual Percentage Rate in as a percent. Please
   do not include additional characters in your input like %."
end

message "Fantastic. We now have everything we need."

loop do # primary loop. information giving loop.
  loop do
    operator_msg = <<-MSG
    What would you like to know?
        1. Your monthly interest rate
        2. Your loan duration in months
        3. Your monthly payment
    MSG

    message operator_msg
    input = gets.chomp

    case input
    when '1'
      message "Your monthly interest rate is #{monthly_interest(apr)}%."
      break
    when '2'
      message "Your loan duration in months: #{months} months."
      break
    when '3'
      message "Your monthly payment: $#{monthly_payment(loan_amount,
                                                        monthly_interest(apr),
                                                        months)}."
      break
    else # Should validate user response.
      message "Please only input 1, 2, or 3."
    end
  end

  break unless another_loop?
end

message "Thank you for joining us today."
message "If you would like to look at another loan, please reload the web page."
