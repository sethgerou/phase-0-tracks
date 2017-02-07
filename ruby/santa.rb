class Santa
    attr_reader :age, :ethnicity #getter methods
    attr_accessor :name, :gender #setter methods
                                 #attr_writer is also available.

    def initialize(gender, ethnicity, name)
      puts "Initializing Santa instance..."
      @gender = gender
      @ethnicity = ethnicity
      @name = name
      @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
      @age = rand(140)
  end

=begin - old getter and setter methods - replaced with attr_reader and attr_accessor

  # getter methods for attributes

    def age
      @age
    end

    def ethnicity
      @ethnicity
    end

    def name
      @name
    end

  # setter methods

    def name=(new_name)
      @name = new_name
    end

    def gender=(new_gender)
      @gender = new_gender
    end
=end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type} cookie!"
  end

  def print_name_gender_and_race
    puts "#{@name} identifies as #{@gender.capitalize} and #{@ethnicity}."
  end

  def celebrate_birthday
    @age += 1
    puts "Happy Birthday #{@name}!!! You've finally turned #{@age}!"
  end

  def get_mad_at(reindeer)
    puts "-"*30
    p @reindeer_ranking
    @reindeer_ranking.delete(reindeer)
    @reindeer_ranking.push(reindeer)
    puts "Don't do that again #{reindeer}!"
    p @reindeer_ranking
    puts "-"*30
  end

end

=begin
seattle_santa = Santa.new("male", "french")
seattle_santa.speak
seattle_santa.eat_milk_and_cookies("chocolate chip")
=end

santas = [] # an array to store instances of Santa class.

genders = ["agender","androgyne","androgynous","bigender","cis","cisgender","cis female",
  "cis male","cis man","cis woman","cisgender female","cisgender male","cisgender man",
  "cisgender woman","female to male","ftm","gender fluid","gender nonconforming",
  "gender questioning","gender variant","genderqueer","intersex","male to female",
  "mtf","neither","neutrois","non-binary","other","pangender","trans","trans*",
  "trans female","trans* female","trans male","trans* male","trans man",
  "trans* man","trans person","trans* person","trans woman","trans* woman",
  "transfeminine","transgender","transgender female","transgender male",
  "transgender man","transgender person","transgender woman","transmasculine",
  "transsexual","transsexual female","transsexual male","transsexual man",
  "transsexual person","transsexual woman","two-spirit"]

ethnicities = ["White","Arab","English","French","German","Irish","Italian",
  "Near Easterner","Polish","Scottish","Armenian","Assyrian","Egyptian","Iranian",
  "Iraqi","Lebanese","Middle East","Palestinian","Syrian","Other Arab","Afghanistani",
  "Israeli","Californio","Cajun","EUROPEAN","PORTUGUESE","ALBANIAN","CROATIAN","CZECH",
  "RUSSIAN","UKRANIAN","CZECHOSLOVAKIAN","BOSNIAN","KOSOVIAN","Multiple WHITE responses",
  "Black","African","African American","AfroAmerican","Nigritian","Negro","Bahamian",
  "Barbadian","Botswana","Ethiopian","Haitian","Jamaican","Liberian","Namibian","Nigerian",
  "Other African","Tobago","Trinidad","West Indies","Zaire","ERITREAN","TOGOLESE","SOMALIAN",
  "Multiple BLACK or AFRICAN AMERICAN","American Indian","Bangladeshi","Bhutanese","Burmese",
  "Cambodian","Chinese","Taiwanese","Filipino","Hmong","Indonesian","Japanese","Korean",
  "Laotian","Malaysian","Okinawan","Pakistani","Sri Lankan","Thai","Amerasian","Asian",
  "Asiatic","Eurasian","Mongolian","Oriental","Whello","Yello","Indo Chinese","Iwo Jiman",
  "Maldivian","Nepalese","Singaporean","MADAGASCAR","MIEN","TIBETAN",
  "Multiple ASIAN responses","Native Hawaiian","Hawaiian","Part Hawaiian","Samoan",
  "Tahitian","Tongan","Polynesian","Tokelauan","Guamanian","Chamorro","Mariana Islander",
  "Marshallese","Palauan","Carolinian","Kosraean","Micronesian","Pohnpeian","Saipanese",
  "Kirabati","Chuukese","Yapese","Fijian","Melanesian","Papua New Guinean",
  "Solomon Islander","New Hebrides","Pacific Islander","Multiple NATIVE HAWAIIAN and OTHER",
  "Argentinean","Bolivian","Central American","Chicano","Chilean","Colombian","Costa Rican",
  "Cuban","Ecuadorian","Salvadoran","Guatemalan","Hispanic","Honduran","Latin American",
  "Mestizo","Mexican","Nicaraguan","Panamanian","Paraguayan","Peruvian","Puerto Rican",
  "Morena","South American","Spanish","Spanish American","Sudamericano","Uruguayan",
  "Venezuelan","Spaniard","Tejano","Cayman Islander","Moroccan","North African",
  "United Arab Emirates","South African","Azerbaijani","Aryan","Dominican Republic",
  "Dominica Islander","Belizean","Bermudan","Aruba Islander","Cayenne","Guyanese",
  "Surinam","Sudanese","Brazilian","Brown","Bushwacker","Cape Verdean","Chocolate",
  "Coe Clan","Coffee","Cosmopolitan","Issues","Jackson White","Melungeon","Mixed",
  "Ramp","Wesort","Mulatto","Moor","Biracial","Creole","Indian","Turk","Half Breed",
  "Rainbow","Octoroon","Quadroon","Multiracial","Interracial","Multiethnic",
  "Multinational","JEWISH","CANADIAN","FRENCH CANADIAN","IBERIAN","TRIGUENO",
  "MALADA","OTHER SPANISH","OTHER RACE, N.E.C.","Multiple SOME OTHER RACE responses",
  "American","Uncodable","Deferred","UNKNOWN"]

names = ["Eddy Labrador","Alexis Hammack","Ronna Langstaff","Nydia Slusher",
  "Fredricka Nagel","Lidia Grabowski","Neda Hersh","Kitty Creekmore","Lorette Priolo",
  "Susann Authement","Dora Langlois","Vikki Nierman","Lisette Ellerman","Jenna Devers",
  "Ula Devos","Leandro Hutsell","Coral Gundlach","Sunni Kahre","Brian Keller",
  "Eboni Demarco"]

ethnicities.length.times do |a| # for the number of items in the ethnicities array
  # create a new instance of Santa with a random name, gender, and ethnicity.
  santas << Santa.new(genders[rand(genders.length-1)],
  ethnicities[rand(ethnicities.length-1)],
  names[rand(names.length-1)])
end

puts "-"*30 # dividing line

santas.each do |n| # for each Santa instance in the santas array
  n.print_name_gender_and_race # call the method that prints name, gender, and ethnicity
end

puts "-"*30

# or...
santas.each {|n| puts "#{n.name}, #{n.ethnicity}, #{n.age}, #{n.gender}\n" }

puts "-"*30
puts "Renaming a santa using a setter method:"
santas[3].name = "Bi-Curious George" # rename the santa at index 3 to "Bi-Curious George"
puts santas[3].name

puts "\nReassigning the gender of a santa using a setter method:"
santas[4].gender = "PREFERS NOT TO SAY, THANK YOU VERY MUCH!" #reasssign gender of
                                              # the santa instance at santas[index 4]
puts santas[4].gender

puts "-"*30
santas[5].celebrate_birthday # call celebrate_birthday on santa instance
                             # at santas[index 5]

santas[6].get_mad_at("Vixen") # call get_mad_at method on santa instance
                              # at santas[index 6]
