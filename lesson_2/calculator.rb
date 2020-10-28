# Calculator.rb
# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def prompt(message)
  puts "=> #{message}"
end

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def valid_number?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end

def operation_to_message(op)
  message = case op
            when '1'
              'Adding'
            when '2'
              'Subtracting'
            when '3'
              'Multiplying'
            when '4'
              'Dividing'
            end

  message
end

def another_calculation?
  loop do
    prompt messages('another')
    answer = gets.chomp
    if /^y$/i.match(answer) || /^[y][e][s]$/i.match(answer)
      return true
    elsif /^n$/i.match(answer) || /^[n][o]$/i.match(answer)
      return false
    else
      prompt messages('not_valid_answer')
    end
  end
end

prompt messages('welcome')

name = String.new
loop do
  name = gets.chomp
  if name.empty?
    prompt messages('valid_name')
  else
    break
  end
end

prompt "Hi #{name}!"

loop do
  number1 = String.new
  loop do
    prompt messages('first_number')
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt messages('not_valid_number')
    end
  end

  number2 = String.new
  loop do
    prompt messages('second_number')
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt messages('not_valid_number')
    end
  end

  operator_prompt = <<-MSG
What operation would you like to perform?
    1. add
    2. subtract
    3. multiply
    4. divide
  MSG

  prompt operator_prompt

  operator = String.new
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt messages('not_valid_operation')
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_f + number2.to_f
           when '2'
             number1.to_f - number2.to_f
           when '3'
             number1.to_f * number2.to_f
           when '4'
             number1.to_f / number2.to_f
           end

  prompt "The result is #{result}"

  break unless another_calculation?
end

prompt messages('goodbye')
