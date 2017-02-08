require 'SecureRandom' # adding 'SecoreRandom' to generate a uuid

# new shout module with two mixin classes
module Shout
  def angrily(phrase)
    puts "#{phrase}".upcase + "!!!"
  end

  def happily(phrase)
    puts "#{phrase}".downcase + ":) did I say that out loud?"
  end

  def uuid # method to generate a uuid
    SecureRandom.uuid
  end
end

class Person # a new class 'Person' which includes the module 'Shout'.
  include Shout
end

class Politician # a new class 'Politician' which includes the module 'Shout'.
  include Shout
end

# driver code
person = Person.new
person.angrily("I wish it would stop snowing")

politician  = Politician.new
politician.happily("I can't believe my constituents let me get away with this.  ")

pol_id = politician.uuid # calling a pre-existing module
puts "This politician's Unique id is #{pol_id}.  Don't let him get away with this!"

=begin - old Shout module code
module Shout
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yelling_happily(words)
    words.upcase + "! <B <3 <B :) !"
  end
end

# old driver code

puts Shout.yell_angrily("Hey, you there").capitalize
puts Shout.yelling_happily("I'm so glad the snow is finally melting")
=end
