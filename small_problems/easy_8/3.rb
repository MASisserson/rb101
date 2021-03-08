# Leading Substrings

def leading_substrings(string)
  array = []
  1.upto(string.size) { |count| array << string[0, count] }

  array
end

p leading_substrings('abc')# == ['a', 'ab', 'abc']
p leading_substrings('a')# == ['a']
p leading_substrings('xyzzy')# == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
