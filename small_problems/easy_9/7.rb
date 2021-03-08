# Name Swapping

# def swap_name(string)
#   name = string.split
#   "#{name[1]}, #{name[0]}"
# end

def swap_name(name)
  name.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
