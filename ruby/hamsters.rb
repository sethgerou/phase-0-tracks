# Hamster questionaire

# What is hamster's name?
# Determine if hamster wearing nametag, if not, name hamster yourself

puts "Is hamster wearing a nametag? (Yes/No)"
nametag = gets.chomp
if nametag.downcase == "yes"
	puts "What name is on the nametag?"
	name = gets.chomp
else puts "Name the hamster"
	name = gets.chomp
end

# How loud is hamster?
	# Give it on a scale of 1-10
	# If not an integer, ask for an integer
puts "Listen to the hamster. On a scale of 1-10, how loud is it?"
loudness = gets.chomp
# VERIFY INPUT IS A NUMBER 1-10
until loudness.to_i == 1 or loudness.to_i == 2 or loudness.to_i == 3 or loudness.to_i == 4 or loudness.to_i == 5 or loudness.to_i == 6 or loudness.to_i == 7 or loudness.to_i == 8 or loudness.to_i == 9 or loudness.to_i == 10
	puts puts "I'm sorry, give me a number on a scale of 1-10"
	loudness = gets.chomp
end
loudness = loudness.to_i

# What fur color?
puts "Is the fur color black, white, brown, orange, or mixed?"
fur_color = gets.chomp
until fur_color.downcase == "black" or fur_color.downcase == "white" or fur_color.downcase == "brown" or fur_color.downcase == "orange" or fur_color.downcase == "mixed"
	puts "I'm sorry, give me one of the colors I listed as options"
	fur_color = gets.chomp
end

# Is this a good candidate for adoption?

puts "Is this hamster a good candidate for adoption? (Yes/No)"
adoption = gets.chomp
until adoption.downcase == "yes" or adoption.downcase == "no"
	puts "I'm sorry, give me a yes or no answer"
	adoption = gets.chomp
end

# Estimated age of hamster
puts "How many years old do you think this hamster is? Put 0 if under 1 year old. Leave blank if unsure."
age = gets.chomp
# Make sure that input is an integer or nil
until age.to_i == 0 or age.to_i == 1 or age.to_i == 2 or age.to_i == 3 or age.to_i == 4 or age.to_i == 5 or age == nil
	puts "Please enter a year age between 0 and 5"
	age = gets.chomp
end
age = age.to_i

puts "Thanks for entering the data on this hamster!"
puts "Name: #{name}"
puts "Age: #{age}"
puts "Color: #{fur_color}"
puts "Loudness: #{loudness}"
puts "Good candidate for adoption? #{adoption.upcase}"
