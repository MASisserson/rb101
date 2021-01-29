# Lettercase Counter

=begin

1. Convert string to array
1.5 Create a hash
2. Iterate through array with #each, adding to hash values
  Read values using arrays constructed for this purpose.
3. Return hash values

=end

def is_lowercase(string)
  lowercase = ('a'..'z').to_a
  lowercase.include? string
end

def is_uppercase(string)
  uppercase = ('A'..'Z').to_a
  uppercase.include? string
end

def letter_case_count(string)
  case_count = {
    lowercase: 0,
    uppercase: 0,
    neither:   0,
  }
  string.chars.each do |char|
    if is_lowercase(char)
      case_count[:lowercase] += 1
    elsif is_uppercase(char)
      case_count[:uppercase] += 1
    else
      case_count[:neither] += 1
    end
  end

  case_count
end

def letter_case_count(string)
  counts = {}
  charcters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither]   = characters.count { |char| char =~ /[^A-Za-Z]/ }
  counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
