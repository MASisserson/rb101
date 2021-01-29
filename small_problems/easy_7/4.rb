# Swap Case

def swapcase(string)
  string_array = string.chars
  string_array.map do |character|
    case character.downcase == character
    when true  then character.upcase
    when false then character.downcase
    end
  end.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
