# Get the Middle Character

def half_even(string)
  string[((string.size / 2) - 1), 2]
end

def half_odd(string)
  return string if string.size == 1
  string[string.size / 2]
end

def center_of(string)
  if string.empty?
    ''
  elsif string.size.odd?
    half_odd(string)
  else
    half_even(string)
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
