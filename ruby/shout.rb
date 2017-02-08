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
