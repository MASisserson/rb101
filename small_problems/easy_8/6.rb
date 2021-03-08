# fizzbuzz

def print_comma(string)
  print "#{string}, "
end

def fizz_or_buzz(number)
  if (number % 3 == 0) && (number % 5 == 0)
    'fizzbuzz'
  elsif number % 3 == 0
    'fizz'
  elsif number % 5 == 0
    'buzz'
  else
    number.to_s
  end
end

def fizzbuzz(no1, no2)
  no1.upto(no2) do |number|
    if number == no2
      print fizz_or_buzz(number)
    else
      print_comma(fizz_or_buzz(number))
    end
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
