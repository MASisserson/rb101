# Staggered Caps (Part 2)

require 'pry'

def staggered_case(string, keyword='nonletters')
  count = 0
  if keyword == 'letters'
    string.downcase.chars.map do |character|
      if character =~ /[a-z]/
        count += 1
        count.odd? ? character.upcase : character
      else
        character
      end
    end.join
  elsif keyword == 'nonletters'
    string.downcase.chars.map do |character|
        count += 1
        count.odd? ? character.upcase : character
    end.join
  end
end

p staggered_case('I Love Launch School!', 'letters') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS', 'letters') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers', 'letters') == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
