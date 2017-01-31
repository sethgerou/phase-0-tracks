=begin
#
def apple_collector
  apple_collector = 0
  puts "You have #{apple_collector} apples."
  3.times do |x| apple_collector = x
    yield(apple_collector)
  end
  puts "You have #{apple_collector} apples."
end

apple_collector { |name1| puts "You have collected #{name1} apples." }
=end

#
apples = ["fuji", "granny smith", "pink lady", "honeycrisp"]

puts "This is the apples array before .each"
p apples
apples.each { |fruit| puts "I love #{fruit} apples!"}
puts "This is the apples array after .each"
p apples

puts "\n" +"This is the apples array before .map!"
p apples
apples.map! { |fruit| fruit.upcase}
puts "This is the apples array after .map!"
p apples

vegetables = {
  carrot: "orange",
  lettuce: "green",
  eggplant: "purple"
}

puts "\n" + "This is the vegetable hash before .each"
p vegetables
vegetables.each { |fruit, color| puts "#{fruit} is the color #{color}!"}
puts "This is the vegetable hash after .each"
p vegetables

puts "\n" + "This is the vegetable hash before .map"
p vegetables
vegetables2 = vegetables.map { |fruit, color| color.upcase}
puts "This is the vegetable hash after .map"
p vegetables
p vegetables2

=begin
#method 1: delete if less than 5, ARRAY
integer_ary = [1,2,3,4,5,6,7,8,9,10]
integer_ary.delete_if {|value| value < 5}

#method 1: delete if less than 5, HASH
integer_hsh = {
  zero: 0,
  one: 1,
  two: 2,
  four: 4,
  six: 6,
  eight: 8,
  ten: 10
}
integer_hsh.delete_if {|number, value| value < 5}

#method 2: keep if less than 5, ARRAY
integer_ary.keep_if {|value| value < 5}

#method 2: keep if less than 5, HASH
integer_hsh.keep_if {|number, value| value < 5}

#method 3: find minimum value above 'value', ARRAY
integer_ary.bsearch {|value| value >= 1}

#method 3: select hash entires that validate to true, HASH
integer_hsh2 = integer_hsh.select {|number, value| value >= 1 }

#method 4: drop elements until first element that validates to false, ARRAY
integer_ary2 = integer_ary.drop_while {|value| value <= 6}

#method 4: reject true values, and keep false values, does not stop at first false value, HASH
integer_hsh.reject! {|number, value| value.even? }


=end
