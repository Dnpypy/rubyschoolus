require 'sqlite3'

# строка подключения базы данных
db = SQLite3::Database.new 'test.sqlite'

db.execute "SELECT * FROM Cars" do |car|
  puts car
  puts "====="
end

db.close
