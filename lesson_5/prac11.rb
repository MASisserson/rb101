# Practice Problem 11

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

p arr.map { |sub_arr| sub_arr.select { |integer| integer % 3 == 0 } }
