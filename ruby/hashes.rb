# Program to gather interior design customer details

client_details = {
  "favorite colors" => []
}
# Prompt user for needed data
# Convert data to the appropriate type
puts "Please enter new customer information."
puts "\nPlease enter customer name:"
client_details[:name] = gets.chomp
puts "Please enter customer age:"
client_details[:age] = gets.chomp.to_i
puts "How many children does the customer have?"
client_details[:children] = gets.chomp.to_i
puts "Please name customer's decor theme:"
client_details["decor theme"] = gets.chomp
puts "Does the customer like wallpaper? (y/n)"
wallpaper_taste = gets.chomp
if wallpaper_taste == "y"
  client_details["likes wallpaper"] = TRUE
else
  client_details["likes wallpaper"] = FALSE
end
puts "Please enter customer's favorite colors, one at a time.  enter \"done\" when finished."
input = gets.chomp
while input.downcase != "done"
  client_details["favorite colors"] += [input]
  puts "enter another color or \"done\" if you're done."
  input = gets.chomp
end

# print entered data to screen
puts "\n\n"
puts "-"*20
puts "Name: #{client_details[:name]}"
puts "Age: #{client_details[:age]}"
puts "Children: #{client_details[:children]}"
puts "Decor Theme: #{client_details["decor theme"]}"
puts "Likes Wallpaper: #{client_details["likes wallpaper"].to_s}"
puts "Favorite colors: #{client_details["favorite colors"]}"
puts "-"*20

# print the hash to screen
puts client_details

# ask user if they want to change any data
puts "\n\nWould you like to change any of your responses? (y/none)"
change_choice = gets.chomp
if change_choice.downcase == "y" || change_choice.downcase == "yes"
  puts "\n\nWhich field would you like to change?"
  field_choice = gets.chomp
         if field_choice == "favorite colors"
           client_details[field_choice.downcase].clear
           puts "\n\nWhat is your new response for #{field_choice}? enter (done) when done."
           input = gets.chomp
              while input != "done"
                 client_details[field_choice.downcase] += [input]
                 puts "enter another color or enter (done) when finished."
                 input = gets.chomp
              end
         elsif field_choice == "likes wallpaper"
           puts "\n\nWhat is your new response for #{field_choice}?"
           wallpaper_taste = gets.chomp
             if wallpaper_taste == "y"
               client_details["likes wallpaper"] = TRUE
             else
               client_details["likes wallpaper"] = FALSE
             end
         elsif field_choice == "decor theme"
           puts "\n\nWhat is your new response for #{field_choice}?"
           client_details[field_choice.downcase] = gets.chomp
         else
           puts "\n\nWhat is your new response for #{field_choice}?"
           client_details[field_choice.downcase.to_sym] = gets.chomp
         end
else
  puts "\n\nGlad you're happy with your responses."
end

# print the updated user data
puts "\n\n"
puts "-"*20
puts "nName: #{client_details[:name]}"
puts "Age: #{client_details[:age]}"
puts "Children: #{client_details[:children]}"
puts "Decor Theme: #{client_details["decor theme"]}"
puts "Likes Wallpaper: #{client_details["likes wallpaper"].to_s}"
puts "Favorite colors: #{client_details["favorite colors"]}"
puts "-"*20

puts client_details
