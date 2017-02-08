# new shout module with two mixin classes
module Shout
  def angrily(phrase)
    puts "#{phrase}".upcase + "!!!"
  end

  def happily(phrase)
    puts "#{phrase}".downcase + ":)"
  end
end

class Person
  include Shout
end

class Politician
  include Shout
end

person = Person.new
person.angrily("I wish it would stop snowing")

politician  = Politician.new
politician.happily("I can't believe my constituents let me get away with all the crap I pull. ")

=begin - old Shout module code
module Shout
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yelling_happily(words)
    words.upcase + "! <B <3 <B :) !"
  end
end

puts Shout.yell_angrily("Hey, you there").capitalize
puts Shout.yelling_happily("I'm so glad the snow is finally melting")
=end
