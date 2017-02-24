# gardener program to track garden status and take notes

require 'sqlite3'

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
    date_planted time,
    date_germinated time,
    date_harvested time,
    date_failed time,
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
    db.execute("UPDATE crops SET date_planted=(CURRENT_DATE) WHERE crop=(?)", [crop])
  elsif occurence == "germinate"
    db.execute("UPDATE crops SET date_germinated=(CURRENT_DATE) WHERE crop=(?)", [crop])
  elsif occurence == "harvest"
    db.execute("UPDATE crops SET date_harvested=(CURRENT_DATE) WHERE crop=(?)", [crop])
  else
    db.execute("UPDATE crops SET date_failed=(CURRENT_DATE) WHERE crop=(?)", [crop])
  end
end

# test code
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

add_note(db, "Cucumber", "Cool as a cucumber")
add_note(db, "Artichoke", "Don't choke.")
=end

# methods to display database content

# display crops, sorted by bed, listing status
# display crops, sorted by status
# display crops: notes
# display crops: time to harvest
# display crops: time to germination

# get user input
