# Question 9

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo)

# Should return no

=begin
foo returns yes
bar('yes') is not 'no', so it will return no.
=end
