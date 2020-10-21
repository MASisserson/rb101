# Repeat Yourself

def repeat(string, number)
  if number > 0 && (string.is_a? String)
    number.times { puts string }
  end
end

string = 'I am a fundraiser.'
number = 3

repeat(string, number)