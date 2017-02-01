# A partial grocery store hash

grocery_store = {
  produce: {
    fruit: ["orange","apple","lemon","lime","watermelon","grapes","kiwi","pineapple"],
    vegetable: ["carrot","lettuce","kale","potato","tomato","broccoli","sweet potato","eggplant","avocado","radish"]
    },

  meat: {
    chicken: {organic: ["breast", "thigh", "wing", "leg"], non_organic: ["parts"]},
    beef: ["ground","cubed","tenderloin","chuck roast","filet mignon","ribs"],
    pork: ["ground","sausage","tenderloin","chops"],
    fish: ["salmon","trout","octopus","oyster","cod"]
    },

  cereal: ["captain crunch","froot loops","cheerios","rice krispies","grape nuts"],

  dairy: {
    cheese: ["cheddar","swiss","brie","cottage"],
    milk: ["skim","2%","whole","organic"]
    },

  other: {
    bakery: ["bread","donut","bagel","english muffin"],
    pet: ["cat food","dog food","cat litter","toys"],
    deli: ["cold cuts","sliced cheese","potato salad"],
    pharmacy: ["advil","tylenol","asprin","alieve"],
    frozen: ["pizza","veggies","eggo waffles"],
    }
}

# showing I know how to use multiple indexes or hash keys (or both) to access nested items. Demonstrating a few different types of access

puts "\n", "-"*30
puts "Types of #{:organic} #{:chicken} in the #{:meat} section:"
grocery_store[:meat][:chicken][:organic].each {|item| puts item} # print each array value in the organic hash in the chichen hash in the meat hash in the grocery store hash.
puts "\n", "-"*30
puts "#{:bakery.capitalize} items:"
grocery_store[:other][:bakery].each {|item| puts item.capitalize} # print each array value in the 'bakery' hash in the 'other' hash in the 'grocery_store' hash.
puts "\n", "-"*30
puts "Does the grocery_store hash include the symbol 'dairy'?"
puts grocery_store.include?("dairy".to_sym) # does the grocery_store hash include the symbol 'dairy'?
puts "\n", "-"*30
puts "Are there 'toys' in the other/pet section of the grocery store?"
puts grocery_store[:other][:pet].include?("toys") # are there toys in the array in the value for the pet key in...
puts "\n", "-"*30
puts "Cereal before adding frosted flakes: #{grocery_store[:cereal]}"
grocery_store[:cereal] << "frosted flakes" # adding a value to a nested array.
puts "\nCereal after adding frosted flakes: #{grocery_store[:cereal]}"
puts "\n", "-"*30
puts "Referencing a nested array value by its index using 'grocery_store[:dairy][:cheese][0]}' produces: #{grocery_store[:dairy][:cheese][0]}"
puts "\n", "-"*30
puts "How many departments are in the 'other' category?"
puts grocery_store[:other].count
puts "\nWhat are their names?"
grocery_store[:other].each_key {|p| puts p.capitalize}
puts "\n", "-"*30
