# Included Modules

a = [5, 9, 3, 11]
puts a.min(2)

# You can't find #min in the array documentation. It is in an included module
# called Enumerable. Included modules allow Ruby to incorporate other class
# behaviors into classes without the pitfalls of multiple inheritance, whatever
# those pit falls are. I don't know yet.