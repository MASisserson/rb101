# Grade Book

=begin

1. Create a hash, with keys as letter grades, and ranges as values, at worst, use arrays for values
2. Average the scores together
3. Check the letter grade hash for the key associated with that value (#include?)
4. Return appropriate key

=end

LETTER_GRADES = {
  'A' => (90..100),
  'B' => (80..89),
  'C' => (70..79),
  'D' => (60..69),
  'F' => (0..60)
}

def get_grade(score_1, score_2, score_3)
  average_score = [score_1, score_2, score_3].sum / 3
  LETTER_GRADES.each_key do |letter|
    return letter if LETTER_GRADES[letter].include? average_score
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
