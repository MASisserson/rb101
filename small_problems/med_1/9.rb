# Fibonacci Numbers (Procedural)

=begin

input: integer (n)
output: none
return: integer

Rules:
1. The answer has to be correct.
2. The final method must not use recursion.
3. No example asks for the 0th element of the sequence

Mental Model:
Build a fibonacci sequence up to the nth element and return final element (nth element).
1. We need only keep track of the final two elements of the fib sequence thus far
  - [1, 1] to start with (sequence)
2. We need a counter to determine how far into the sequence we are
  - This can be done by counting down from integer given in the argument
  - A counter viarable, x, will be made
3. A loop is needed to iterate until x == given argument integer
4. With each iteration, the sequence array should be ammended such that
    sequence[1] = sequence[0] + sequence[1]
    sequence[0] = sequence[1]
    This can be accomplished by assigning temp variables as follows:
    last = seuqence[0] + sequence[1]
    first = sequence[1]
    Then doing the following:
      sequence = [first, last]
    Then x must be reduced by 1

Test:
    fibonacci(10)


=end

def fibonacci(integer)
  x = 2
  sequence = [1, 1]
  until x == integer
    last = sequence[0] + sequence[1]
    first = sequence[1]
    sequence[1] = last
    sequence[0] = first
    x += 1
  end

  sequence.last
end


p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501
