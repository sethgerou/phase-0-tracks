# Ask how many times to execute the loop
puts "how many employees need to be processed?"
to_process = gets.chomp
counter = 1

# iterates through counter until 'to_process' is reached.
while counter <= to_process.to_i
  # Ask new hire for name
  puts "Employee #{counter}, what is your full name?"
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

  # Ask employee about their allergies.
  puts "Are you alergic to anything?  (when you're done listing allergies, please type \"done\")"
  allergy = gets.chomp
  while allergy != "done"
    if allergy.downcase == "sunshine"
      break
    else
      puts "any other allergies? (enter \"done\" when done)"
      allergy = gets.chomp
    end
  end

  case
  when name == "Drake Cula", name == "Tu Fang"
    decision = " are definitely a vampire"
  when allergy.downcase == "sunshine"
    decision = "are probably a vampire"
  when (age.to_i != Time.now.year - birth_year.to_i || age.to_i != (Time.now.year - birth_year.to_i)-1) && (garlic_response.downcase == "no") && (insurance_choice.downcase == "no")
        # Note: we don't know what month the employee was born in, so we're allowing for the possibility they haven't had their birthday yet this year.
    decision = " are almost certainly a vampire"
  when (age.to_i != Time.now.year - birth_year.to_i || age.to_i != (Time.now.year - birth_year.to_i)-1) && (garlic_response.downcase == "no" || insurance_choice.downcase == "no")
    decision = " are probably a vampire"
  when (age.to_i == Time.now.year - birth_year.to_i || age.to_i == (Time.now.year - birth_year.to_i)-1) && (garlic_response.downcase == "yes" || insurance_choice.downcase == "yes")
    decision = " are probably not a vampire"
  else
    decision = "'re results are inconclusive"
  end

  puts "Employee #{counter}, We've decided you#{decision}.\n\n\n"
 counter += 1
end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
