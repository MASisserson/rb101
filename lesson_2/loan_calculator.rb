# loan_calculator.rb

require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')

def valid?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end

def monthly_interest(apr)
  interest = apr.to_f / 12
  interest.round(2)
end

def monthly_payment(loan_amount, monthly_interest, months)
  return format('%.2f', loan_amount.to_f) if months == 0
  return format('%.2f',(loan_amount.to_f / months.to_f)) if monthly_interest == 0

  payment = loan_amount.to_f * ((monthly_interest.to_f/100)/
  (1 - (1 + (monthly_interest.to_f / 100))**(-months.to_f)))

  format('%.2f', payment)
end

def message(string)
  puts "=> " + string
end

def validate_another_loop_input(answer)
  if /^y$/i.match(answer) || /^[y][e][s]$/i.match(answer)
    return true
  elsif /^n$/i.match(answer) || /^[n][o]$/i.match(answer)
    return false
  else
    return nil
  end
end

def another_loop?
  loop do
    message MESSAGES['loop_again?']
    answer = gets.chomp.strip
    unless validate_another_loop_input(answer) == nil
      return validate_another_loop_input(answer)
    end
    message MESSAGES['loop_again_validation']
  end
end

def clear_screen
  system('clear') || system('cls')
end

def get_loan_amount
  loan_amount = String.new
  loop do
    message MESSAGES['loan_amount_request']
    loan_amount = gets.chomp.strip

    break if valid?(loan_amount) && (loan_amount.to_f >= 0)

    message MESSAGES["could_not_read"]
    message MESSAGES["proper_input"]
  end

  loan_amount
end

def get_apr
  apr = String.new
  message MESSAGES['apr_request']
  loop do
    message MESSAGES['percent_request']
    apr = gets.chomp.strip

    break if valid?(apr)

    message MESSAGES['could_not_read']
  end

  apr
end

def get_years
  years = String.new
  message MESSAGES['loan_duration_request']
  loop do
    years = gets.chomp.strip

    break if valid?(years)

    message MESSAGES['could_not_read']
    message MESSAGES['loan_duration_request'] + MESSAGES['no_percent_request']
  end

  years
end

def give_answer(user_input, loan_amount, apr, years, months)
  case user_input
  when '1'
    message "Your monthly interest rate is #{format('%.2f', monthly_interest(apr))}%."
  when '2'
    message "Your loan duration in months: #{months} months"
  when '3'
    message "Your monthly payment: $#{monthly_payment(loan_amount,
                                                      monthly_interest(apr),
                                                      months)}"
  else
    message MESSAGES['123_request']
    return 0
  end
end

def give_options(loan_amount, apr, years, months)
  loop do
    message MESSAGES['operator_message']
    input = gets.chomp.strip
    break if give_answer(input, loan_amount, apr, years, months) != 0
  end
end

def offer_information(loan_amount, apr, years, months)
  loop do
    give_options(loan_amount, apr, years, months)
    again = another_loop?()
    clear_screen()
    break unless again
  end
end

clear_screen()
message MESSAGES['welcome']

loan_amount = get_loan_amount()
apr = get_apr()
years = get_years()
months = years.to_i * 12

message MESSAGES['thank_you']

offer_information(loan_amount, apr, years, months)

clear_screen()
message MESSAGES['goodbye']
message MESSAGES['another_loan']
