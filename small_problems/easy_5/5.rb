# Clean up the words

def cleanup(string)
  string.gsub(/\W+/, ' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
