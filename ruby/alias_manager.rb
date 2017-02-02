# Program that accepts a spy's real name an creates a good alias.
  # Swap the first and last name
  # Change all the vowels to the next vowel in "aeiou"
  # Change everything else to the next consonant in the alpabet
  # Handle - is the letter a vowel? - upper case lettes - edge cases

aliases = {}

def convert_character(char)
  vowels = "aeiou"
  consonants = "bcdfghjklmnpqrstvwxyz"

  # Change all the vowels to the next vowel in "aeiou"
  if vowels.include?(char)
    if char == "u" # edge case handling
      char = "a"
    else
      char = vowels[vowels.index(char) +1] # Change vowel to the next vowel in "aeiou"
    end
  else
    # Change everything else to the next consonant in the alpabet
    if char == "z" # edge case handling
      char = "b"
    elsif consonants.include?(char)
      char = consonants[consonants.index(char) +1] # Change to next consonant in consonants
    else
      char
    end
  end
end

def alias_generator(name)
  fake_name = ""
  # Swap the first and last name
  first_last_swap = name.split(" ").reverse.join(" ")
  # convert each character and store in 'fake_name'
  first_last_swap.chars.each do |character|
    fake_name += convert_character(character)
  end
  fake_name.split.map {|name| name.capitalize}.join(" ") # return capitalized fake_name.
end

# ask user for a name
puts "Please enter a name to get a new fake name. ('exit' to end.)"
true_name = gets.chomp.downcase # get user input and handle capital letters.
while true_name != "exit" # check for exit condition, otherwise repeat
  new_name = alias_generator(true_name) # gets fake name and stores it in new name.
  truename_caps = true_name.split(" ").map {|name| name.capitalize}.join(" ") # capitalizes true name.
  puts new_name #print the new alias
  aliases[truename_caps] = new_name #stores each old name and new alias in a hash.
  puts "Another one?  ('exit' to end.)"
  true_name = gets.chomp
end

# print the true name and the corresponding fake name
aliases.each {|name, fake_name| puts "#{name}'s fake name is #{fake_name}."}
