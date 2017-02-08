# a program that defines a puppy class and a gymnast class, with some example driver code.
class Puppy # a puppy class with a few tricks
  def initialize
    puts "Initializing new puppy instance..."
  end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(number)
    number.times{ puts "Woof!"}
  end

  def roll_over
    puts "*rolls over*"
  end

  def dog_years(years)
    years * 7
  end

  def sit
    puts "*Puppy sits*"
  end
end

class Gymnast # a gymnast class with a few tricks
  def initialize
    puts "Initialized an instance of Gymnast."
  end

  def jump(number)
    "Gymnast jumps #{number} times."
  end

  def flip(direction)
    "Gymnast does a #{direction}-flip."
  end

  def cartwheel
    "Gymnast does a cartwheel."
  end
end

# puppy driver code
fido = Puppy.new
fido.fetch("ball")
fido.speak(2)
fido.roll_over
puts fido.dog_years(3)
fido.sit

gymnasts = [] # array to store gymnasts

# Gymnast driver code

50.times {gymnasts.push(Gymnast.new)} # create 50 gymnast instances and store them the array "gymnasts"

gymnasts.each do |n| # for each gymnast in the array, have them do a few tricks.
  puts n.flip("front")
  puts n.jump(4)
  puts n.cartwheel
end
