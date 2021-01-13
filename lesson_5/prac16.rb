# Practice Problem 16

def generate_digits(number_of_digits) # Returns a digit for the UUID
  values = [
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
    '1', '2', '3', '4', '5', '6', '7', '8', '9'
  ]

  uuid_segment = String.new
  loop do
    uuid_segment << values.sample

    break if uuid_segment.length == number_of_digits
  end

  uuid_segment
end

def create_UUID
  uuid = generate_digits(8) + '-' + generate_digits(4) + '-' +
  generate_digits(4) + '-' + generate_digits(4) + '-' +
  generate_digits(12)

  uuid
end

puts create_UUID()
