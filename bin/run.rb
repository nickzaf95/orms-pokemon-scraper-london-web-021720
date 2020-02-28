require_relative "environment"
DB = {:conn => SQLite3::Database.new("db/students.db")}

Scraper.new(@db).scrape

all_pokemon = @db.execute("SELECT * FROM pokemon;")

# test out your code here!
