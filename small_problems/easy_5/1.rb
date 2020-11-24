# ASCII String Value

def ascii_value(string)
  return 0 if string.empty?
  
  characters = string.chars
  sum = 0
  until characters.empty?
    sum += characters[-1].ord
    characters.pop
  end

  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
