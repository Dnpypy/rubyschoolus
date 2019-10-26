require 'sqlite3'


# строка подключения базы данных
db = SQLite3::Database.new 'barbershop.db'

unless File.zero?('barbershop.db')

  db.execute "SELECT * FROM 'Users'" do |shop|
    puts shop
    puts "======"
  end

  db.execute "SELECT * FROM 'Contacts'" do |contact|
    puts contact
    puts "======"
  end

else

  # Users table
   db.execute " CREATE TABLE 'Users' ('Id' INTEGER PRIMARY KEY AUTOINCREMENT,
  'login' TEXT, 'phone' TEXT, 'datestamp' TEXT, 'barber' TEXT,
  'Color' VARCHAR)"

  db.execute "INSERT INTO Users (Name, Phone, Datestamp, Barber, Color)
  VALUES ('Miladin', 777-66-77, 21102020, 'Alex', 'Red')"

  db.execute "INSERT INTO Users (Name, Phone, Datestamp, Barber, Color)
  VALUES ('Yasmina', 777-66-77, 21112022, 'John', 'Yellow')"

   db.execute "INSERT INTO Users (Name, Phone, Datestamp, Barber, Color)
  VALUES ('Sasha', 777-66-77, 21122022, 'Lexx', 'Green')"

  # contacts table
  db.execute " CREATE TABLE 'Contacts' ('Id' INTEGER PRIMARY KEY AUTOINCREMENT,
  'Email' VARCHAR, 'Message' INTEGER)"

  db.execute "INSERT INTO Contacts (Email, Message)
  VALUES ('Milad@mil.ru','Inserting rows.One of the most common tasks' )"

  db.execute "INSERT INTO Contacts (Email, Message)
  VALUES ('Sasha@sasg.ru', 'After you have some rows inserted, need to update the rows')"


end

db.close
