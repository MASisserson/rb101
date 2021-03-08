# Diamonds!

=begin

Output: A diamond shaped with asterisks
Input: An odd integer

Requirements:
1. Empty space between program running and the firs asterisk?
2. The diamond vertices are constructed of integer asterisks
  - Each tip is made up of one asterisk
  - Each later has 2 more / less asterisks than the previous layer
3. Spaces make up the line around the asterisks uch that they are centered
4. Always has at least 1 asterisk

Problems:
1. printing a line
  - Spaces printed before and after asterisks
    spaces_per_side = ((line_length - asterisks) / 2)
2. Growing then reducing number of asterisks
  2 loops can work through the rising and then lowering of the asterisk count
  A break condition can be put in the beginning of the first loop account for integer == 1


Mental Model:
1. Print a new line of a incrementally growing and then reducing number of asterisks with spaces on the side so that the asterisks are centered.


=end

# def print_line(length, asterisks)
#   puts (" " * ((length - asterisks) / 2)) + ("*" * asterisks) + (" " * ((length - asterisks) / 2))
# end

def print_line(length, asterisks)
  case asterisks
  when 1
    puts (" " * ((length - asterisks) / 2)) + ("*" * asterisks) + (" " * ((length - asterisks) / 2))
  else
    puts (" " * ((length - asterisks) / 2)) + "*" + (" " * (asterisks - 2)) + "*" + (" " * ((length - asterisks) / 2))
  end
end

def diamond(integer)
  puts ""
  asterisks = 1
  loop do
    break if asterisks == integer
    print_line(integer, asterisks)
    asterisks += 2
  end

  asterisks = integer
  loop do
    break if asterisks <= 0
    print_line(integer, asterisks)
    asterisks -= 2
  end
end


diamond(1)
diamond(3)
diamond(9)
