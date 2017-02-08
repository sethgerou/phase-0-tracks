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

fido = Puppy.new
fido.fetch("ball")
fido.speak(2)
fido.roll_over
puts fido.dog_years(3)
fido.sit
