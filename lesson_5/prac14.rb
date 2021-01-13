# Practice Problem 14

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

p hsh.each_with_object([]) { |(k,sub_hsh), arr|
  if sub_hsh[:type] == 'fruit'
    arr << sub_hsh[:colors].map { |string| string.capitalize }
  else
    arr << sub_hsh[:size].upcase
  end
}
