# Matching Parenthesis?

=begin

input: string
return: boolean true or false

Rules:
1. Parenthesis must have matching pairs to return true, false  otherwise
2. Balanced pairs must start with (, not )
3. Anytime ) appears first, the string will return false
4. Just ( returns false too

Mental Model:
I can track the number of parenthesis segments with variables and if they balance out in the right order by the end, return true.
I will return false otherwise.

High level Plan:
1. Initialize variables for parenthesis counting (open, close)
2. iterate through string, tallying the parenthesis found
3. Determine if ther is a close before any open, if this is the case, return false
4. Return true if tallies even out

Some lower level Thoughts:
1. close can count down, while open counts up. They can, in fact, be one variable (tally)
2. If tally goes negative ever, false is returned.
3. If tally is points to 0 at the end, true is returned
4. Otherwise, false is returned.

=end

def balanced?(string)
  tally = 0

  string.each_char do |char|
    break if tally < 0

    tally += 1 if char == '('
    tally -= 1 if char == ')'
  end

  tally.zero?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
