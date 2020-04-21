
# Collect a string from a user
print "What would you like to encrypt?"
text = gets.chomp
# Collect an integer from a user
puts "How many places do you want to shift the cipher?"
number = gets.chomp.to_i
# seperate each character from the string into an array
def caesar_cipher(string, number)
    caesar_string = ""
    string.scan (/./) do |i|
# cycle through each character from the user input through the dictionary array
if ("a".."z").include? (i.downcase)

# shift right by the shift factor
number.times {i = i.next}
end
# replace letter to original string array and join back string
caesar_string << i[-1]
end
# Give output back to user
return caesar_string
end

puts caesar_cipher(text, number)