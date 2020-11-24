# Short Long Short

=begin
if first > second
  use #insert on beginning and end of first
else
  use #insert on beginning and end of second
end
=end

def short_long_short(first, second)
  if first.size > second.size
    first.insert(0, second).insert(-1, second)
  else
    second.insert(0, first).insert(-1, first)
  end
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"

=begin

Using '+' instead of #insert would likely be better for clarity.

=end
