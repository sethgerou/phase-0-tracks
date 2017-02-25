# gardener program to track garden status and take notes

require 'sqlite3'
require 'time'

# create database
db = SQLite3::Database.new("gardener.db")
# use tbd
db.results_as_hash = true

# create tables
create_crops_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS crops (
    id INTEGER PRIMARY KEY,
    crop varchar(255),
    bed_number INTEGER,
    date_planted INTEGER,
    date_germinated INTEGER,
    date_harvested INTEGER,
    date_failed INTEGER,
    notes_id INTEGER,
    FOREIGN KEY (notes_id) REFERENCES notes(id)
  )
SQL

create_notes_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS notes (
    id INTEGER PRIMARY KEY,
    note1 varchar(255),
    note2 varchar(255),
    note3 varchar(255),
    note4 varchar(255),
    note5 varchar(255),
    note6 varchar(255),
    note7 varchar(255),
    note8 varchar(255),
    note9 varchar(255),
    note10 varchar(255)
  )
SQL

db.execute(create_crops_table_cmd)
db.execute(create_notes_table_cmd)

# methods to add/modify database content
def add_crop(db, crop, bed_number)
  occurence = "plant"
  db.execute("INSERT INTO crops (crop, bed_number) values (?, ?)", [crop, bed_number])
  log(db, occurence, crop)
end

def add_note(db, crop, note)
  id = db.execute("SELECT crops.notes_id FROM crops WHERE crop=(?)", [crop]) #are there existing notes for this crop?

  if id[0]["notes_id"] == nil
    db.execute("INSERT into notes (note1) values (?)", [note])
    new_note_id = db.execute("SELECT notes.id FROM notes WHERE note1=(?)", [note])
    db.execute("UPDATE crops SET notes_id=(?) WHERE crop=(?)", [new_note_id[0][0], crop])
  else
    notes = db.execute("SELECT * FROM notes WHERE id=(?)", [id[0]["notes_id"]])
    if notes[0]["note2"] == nil
      db.execute("UPDATE notes SET note2=(?) WHERE id=(?)", [note, id[0]["notes_id"]])
    elsif notes[0]["note3"] == nil
      db.execute("UPDATE notes SET note3=(?) WHERE id=(?)", [note, id[0]["notes_id"]])
    elsif notes[0]["note4"] == nil
      db.execute("UPDATE notes SET note4=(?) WHERE id=(?)", [note, id[0]["notes_id"]])
    elsif notes[0]["note5"] == nil
      db.execute("UPDATE notes SET note5=(?) WHERE id=(?)", [note, id[0]["notes_id"]])
    elsif notes[0]["note6"] == nil
      db.execute("UPDATE notes SET note6=(?) WHERE id=(?)", [note, id[0]["notes_id"]])
    elsif notes[0]["note7"] == nil
      db.execute("UPDATE notes SET note7=(?) WHERE id=(?)", [note, id[0]["notes_id"]])
    elsif notes[0]["note8"] == nil
      db.execute("UPDATE notes SET note8=(?) WHERE id=(?)", [note, id[0]["notes_id"]])
    elsif notes[0]["note9"] == nil
      db.execute("UPDATE notes SET note9=(?) WHERE id=(?)", [note, id[0]["notes_id"]])
    elsif notes[0]["note10"] == nil
      db.execute("UPDATE notes SET note10=(?) WHERE id=(?)", [note, id[0]["notes_id"]])
    else
      return false
    end
  end
end

def log(db, occurence, crop)
  if occurence == "plant"
    db.execute("UPDATE crops SET date_planted=(CURRENT_TIMESTAMP) WHERE crop=(?)", [crop])
  elsif occurence == "germinate"
    db.execute("UPDATE crops SET date_germinated=(CURRENT_TIMESTAMP) WHERE crop=(?)", [crop])
  elsif occurence == "harvest"
    db.execute("UPDATE crops SET date_harvested=(CURRENT_TIMESTAMP) WHERE crop=(?)", [crop])
  else
    db.execute("UPDATE crops SET date_failed=(CURRENT_TIMESTAMP) WHERE crop=(?)", [crop])
  end
end

# first run test code
=begin
add_crop(db, "Broccoli", 6)
add_crop(db, "Spinach", 2)
add_crop(db, "Romaine Lettuce", 3)
add_crop(db, "New Potatoes", 2)
add_crop(db, "Radishes", 3)
add_crop(db, "Artichoke", 2)
add_crop(db, "Cucumber", 1)
add_crop(db, "Carrots", 5)
add_crop(db, "Onions", 5)
add_crop(db, "Garlic", 6)

log(db, "germinate", "Garlic")
log(db, "harvest", "Carrots")
log(db, "fail", "Radishes")
log(db, "germinate", "Radishes")

add_note(db, "Cucumber", "Cool as a cucumber")
add_note(db, "Artichoke", "Don't choke.")
=end

# methods to display database content

# display crops, sorted by bed, listing status
def display_crops_by_bed(db)
  beds = []
  crops_beds = db.execute("SELECT crops.bed_number, crops.crop FROM crops")
  puts "Displaying crops by bed...\n\n"
  crops_beds.each do |crop|
    beds.push("#{crop["bed_number"]}: #{crop["crop"]}")
  end
  puts beds.sort
end

# display crops, sorted by status
def display_crops_by_status(db)
  status = []
  crops_status = db.execute("SELECT crops.crop, crops.date_planted, crops.date_germinated,
  crops.date_harvested, crops.date_failed FROM crops")
  puts "Displaying crops by status...\n\n"
  crops_status.each do |crop|
    if crop["date_failed"] != nil
      status.push("4) FAILED: #{crop["crop"]} failed on #{Time.parse(crop["date_failed"]).to_date}")
    elsif crop["date_harvested"] != nil
      status.push("3) HARVESTED: #{crop["crop"]} harvested on #{Time.parse(crop["date_harvested"]).to_date}")
    elsif crop["date_germinated"] != nil
      status.push("2) GERMINATED: #{crop["crop"]} germinated on #{Time.parse(crop["date_germinated"]).to_date}")
    else
      status.push("1) PLANTED: #{crop["crop"]} planted on #{Time.parse(crop["date_planted"]).to_date}")
    end
  end
  status.sort.each {|crop| puts "#{crop}"}
end

# display crops: notes
def display_crop_with_notes(db, crop_select)
  crops_notes = db.execute("SELECT crops.crop, notes.note1, notes.note2, notes.note3,
                            notes.note4, notes.note5, notes.note6, notes.note7,
                            notes.note8, notes.note9, notes.note10 FROM crops
                            INNER JOIN notes ON notes_id = notes.id")

  crops_notes.each do |crop|
        if crop["crop"] == crop_select
            puts "\n#{crop["crop"]}:\n\n#{crop["note1"]}\n#{crop["note2"]}\n#{crop["note3"]}\n#{crop["note4"]}\n#{crop["note5"]}\n#{crop["note6"]}\n#{crop["note7"]}\n#{crop["note8"]}\n#{crop["note9"]}\n#{crop["note10"]}"
        end
    end
    puts "\n(end of notes.)"
end

# display crops: time to harvest
def display_time_to_harvest(db)
  harvested = db.execute("SELECT crops.crop, crops.date_harvested, crops.date_planted FROM crops")
  harvested.each do |crop|
    if crop["date_harvested"] != nil
      harvest_time = Time.parse(crop["date_harvested"]).to_i
      planted_time = Time.parse(crop["date_planted"]).to_i
      time_to_harvest = ((harvest_time - planted_time)/86164.1).floor
      puts "#{crop["crop"]} was harvested in #{time_to_harvest} days."
    end
  end
end

# display crops: time to germination
def display_time_to_germinate(db)
  germinated = db.execute("SELECT crops.crop, crops.date_germinated, crops.date_planted FROM crops")
  germinated.each do |crop|
    if crop["date_germinated"] != nil
      germination_time = Time.parse(crop["date_germinated"]).to_i
      planted_time = Time.parse(crop["date_planted"]).to_i
      time_to_germinate = ((germination_time - planted_time)/86164.1).floor
      hours_to_germinate = ((germination_time - planted_time)/3600).floor
      puts "#{crop["crop"]} germinated in #{time_to_germinate} days. (#{hours_to_germinate} hours)"
    end
  end
end

# user interface
system("clear") or system("cls")
puts "Welcome to Gardener - a garden tracking tool.\n\n"
input = ""
while input != "e"
  puts "\nWhat would you like to do?\n\n"
  puts "(1)-plant a crop. (2)-log a crop status. (3)-add a crop note."
  puts "(4)-view garden by bed. (5)-view garden by status."
  puts "(6)-display harvest times. (7)- display germination times."
  puts "(8)-display notes for a crop. (e)-exit."
  input = gets.chomp
  if input == "1"
    puts "What crop did you plant?"
    crop = gets.chomp
    puts "In what bed number?"
    bed_number = gets.chomp
    add_crop(db, crop, bed_number)
  elsif input == "2"
    system("clear") or system("cls")
    garden = db.execute("SELECT crops.id, crops.crop FROM crops")
    garden.each {|crop| puts "(#{crop["id"]})- #{crop["crop"]}"}
    puts "Which crop would you like to update?"
    id = gets.chomp
    crop = db.execute("SELECT crops.crop from crops where id=(?)", [id])
    puts "What event would you like to log?"
    puts "(1)- Germinate. (2)-Harvest. (3)Fail."
    event_id = ""
    until event_id == "1" or event_id =="2" or event_id=="3"
      event_id = gets.chomp
      if event_id == "1"
        log(db, "germinate", crop[0]["crop"])
        break
      elsif event_id == "2"
        log(db, "harvest", crop[0]["crop"])
        break
      elsif event_id == "3"
        log(db, "fail", crop[0]["crop"])
        break
      else
        puts "I didn't understand your choice, please enter 1,2,or 3"
        break
      end
    end
  elsif input == "3"
    system("clear") or system("cls")
    garden = db.execute("SELECT crops.id, crops.crop FROM crops")
    garden.each {|crop| puts "(#{crop["id"]})- #{crop["crop"]}"}
    puts "Which crop would you like to add a note to?"
    id = gets.chomp
    crop = db.execute("SELECT crops.crop from crops where id=(?)", [id])
    puts "Please enter your note on a single line - 255 characters max."
    note = gets.chomp
    add_note(db, crop[0]["crop"], note)
  elsif input == "4"
    system("clear") or system("cls")
    display_crops_by_bed(db)
  elsif input == "5"
    system("clear") or system("cls")
    display_crops_by_status(db)
  elsif input == "6"
    system("clear") or system("cls")
    display_time_to_harvest(db)
  elsif input == "7"
    system("clear") or system("cls")
    display_time_to_germinate(db)
  elsif input == "8"
    system("clear") or system("cls")
    garden = db.execute("SELECT crops.id, crops.crop FROM crops")
    garden.each {|crop| puts "(#{crop["id"]})- #{crop["crop"]}"}
    puts "What crop would you like to get notes for?"
    id = gets.chomp
    crop = db.execute("SELECT crops.crop from crops where id=(?)", [id])
    display_crop_with_notes(db, crop[0]["crop"])
  elsif input == "e"
    break
  else
    puts "Sorry, I didn't understand your choice. Please try again."
  end

  end
