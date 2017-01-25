# Ask new hire for name
puts "how many employees need to be processed?"
to_process = gets.chomp
counter = 1

while counter <= to_process.to_i
  puts "What is your full name?"
  name = gets.chomp

  # Ask age of new hire
  puts "How old are you? (numbers only please)"
  age = (gets.chomp)

  # Ask what year new hire was born
  puts "What year were you born in?"
  birth_year = gets.chomp

  # Ask whether the new hire will eat garlic bread
  puts "I hear they're serving garlic bread in the cafeteria today.  Sound good?"
  garlic_response = gets.chomp

  # Ask whether the new hire would like to enroll in company health insurance.
  puts "Would you like to enroll in company insurance?"
  insurance_choice = gets.chomp

  case
  when name == "Drake Cula", name == "Tu Fang"
    decision = "Definitely a vampire"
    # we don't know what month the employee was born in, so we're allowing for the possibility they haven't had their birthday yet this year.
  when (age.to_i == Time.now.year - birth_year.to_i || age.to_i == (Time.now.year - birth_year.to_i)-1) && (garlic_response.downcase == "yes" || insurance_choice.downcase == "yes")
    decision = "Probalby not a vampire"
  when (age.to_i != Time.now.year - birth_year.to_i || age.to_i == (Time.now.year - birth_year.to_i)-1) && (garlic_response.downcase == "no" || insurance_choice.downcase == "no")
    decision = "Probably a vampire"
  when (age.to_i != Time.now.year - birth_year.to_i || age.to_i == (Time.now.year - birth_year.to_i)-1) && (garlic_response.downcase == "no") && (insurance_choice.downcase == "no")
    decision = "Almost certainly a vampire"
  else
    decision = "Results inconclusive"
  end

  puts "Candidate #{counter}, We've decided you're #{decision}.\r"
 counter += 1
end
