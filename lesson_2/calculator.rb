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

def clear_screen
  system('clear') || system('cls')
end

def get_name
  name = String.new
  loop do
    name = gets.chomp
    if name.strip.empty?
      prompt messages('valid_name')
    else
      break
    end
  end

  name
end

def get_number(position)
  input = String.new
  loop do
    prompt messages('first_number')  if position == 1
    prompt messages('second_number') if position == 2
    input = gets.chomp

    if valid_number?(input)
      break
    else
      prompt messages('not_valid_number')
    end
  end

  input
end

clear_screen()
prompt messages('welcome')

name = get_name()

prompt "Hi #{name}!"

loop do
  number1 = get_number(1)

  number2 = get_number(2)

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
  continue = another_calculation?()

  clear_screen()

  break unless continue
end

prompt messages('goodbye')
