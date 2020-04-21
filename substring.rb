# Create a dictionary of words (in an array)
$dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
# accept input from user
puts "Please enter a word or phrase"
$user_input = gets.chomp

def find_substring(string)
  final_array = []
  final_hash = Hash.new(0)
 
# seperate each word in string to an array
string_array = string.downcase.split(" ")
# seperate each element in array by one letter
string_array.each do |word|
  length = word.length
  length.times do
  final_array.push(word) 
  word = word[0...-1]
  
  end
end

#check if dictionary includes any of the words
final_array.each {|i| 

if $dictionary.include? i
 final_hash[i] += 1
end
}
return final_hash
# return hash with each word and count
end

find_substring($user_input)
