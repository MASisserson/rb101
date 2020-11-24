# Bannerizer

=begin
WHAT I NEED
Print the string with one space before and one space after.
Have a line of spaces equal to the size of the above below and above the string.
Have a line of dashes equal in size above and below that.
2 columns, one in beginning and one at end. + on top and bottom | between

ALGORITHM
Deal one line at a time.
Something like below:
"+#{'-'*(string.size-2)}+/n"
etc.
=end

def print_in_box(string)
  puts "+#{'-'*(string.size+2)}+"
  puts "|#{' '*(string.size+2)}|"
  puts "| #{string} |"
  puts "|#{' '*(string.size+2)}|"
  puts "+#{'-'*(string.size+2)}+"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
