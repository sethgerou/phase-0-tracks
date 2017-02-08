=begin
class Puppy

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
=end

class Gymnast
  def initialize
    puts "Initialized an instance of Gymnast."
  end

  def jump(number)
    puts "Gymnast jumps #{number} times."
  end

  def flip(direction)
    puts "Gymnast does a #{direction}-flip."
  end

  def cartwheel
    puts "Gymnast does a cartwheel."
  end
end
=begin
fido = Puppy.new
fido.fetch("ball")
fido.speak(2)
fido.roll_over
puts fido.dog_years(3)
fido.sit
=end

gymnasts = []

50.times {gymnasts.push(Gymnast.new)}
