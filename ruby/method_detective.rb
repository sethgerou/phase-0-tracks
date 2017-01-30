# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

puts "iNvEsTiGaTiOn".swapcase
puts "iNvEsTiGaTiOn".swapcase!
# => “InVeStIgAtIoN”

puts "zom".gsub("o", "oo")
puts "zom".gsub("zom", "zoom")
puts "zom".gsub("zo", "zoo")
puts "zom".gsub("om", "oom")
puts "zom".replace("zoom")
puts "zom".insert(1, "o")
puts "zom".insert(2, "o")
puts "zom".insert(-2, "o")
puts "zom".insert(-3, "o")
puts "zom".sub("o", "oo")
puts "zom".sub("zom", "zoom")
puts "zom".sub("zo", "zoo")
puts "zom".sub("om", "oom")
# => “zoom”

puts "enhance".center(15)
puts "enhance".rjust(11).ljust(15)
puts "enhance".insert(0, "    ").insert(11, "    ")
puts "enhance".sub("enhance", "    enhance    ")
puts "enhance".gsub("enhance", "    enhance    ")
# => "    enhance    "

puts "Stop! You’re under arrest!".upcase
# => "STOP! YOU’RE UNDER ARREST!"

puts "the usual"+" suspects"
puts "the usual" << " suspects"
puts "the usual".insert(9, " suspects")
#=> "the usual suspects"

puts " suspects".insert(0, "the usual")
# => "the usual suspects"

puts "The case of the disappearing last letter".chop
puts "The case of the disappearing last letter".sub("letter", "lette")
# => "The case of the disappearing last lette"

puts "The mystery of the missing first letter".slice(1, -1)
puts "The mystery of the missing first letter".sub("T", "")
puts "The mystery of the missing first letter".gsub("T", "")
puts "The mystery of the missing first letter".delete("T")
# => "he mystery of the missing first letter"

puts "Elementary,    my   dear        Watson!".squeeze
# => "Elementary, my dear Watson!"

puts "z".ord
# => 122
# (What is the significance of the number 122 in relation to the character z?)

puts "How many times does the letter 'a' appear in this string?".count("a")
# => 4
