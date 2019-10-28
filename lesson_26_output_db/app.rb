
# Вывод базы данных
# Чтобы вывезти базу данных на экран нам нужно вывезти SELECT запрос

# подгружаем библиотеку sqlite3
require 'sqlite3'

# создаем подключение к базе данных
db = SQLite3::Database.new ("barbershop.db")

# (через хэш)чтобы выводить результаты виде хэша
db.results_as_hash = true

# (через хэш)выполняется запрос селект с помощью команды execute
db.execute 'select * from Users' do |row|
      # обращение по ключу row['name']
      puts row['username']
      print "\t\t"
      # обращение по ключу row['datestamp']
      puts row['datestamp']
      puts '=========='
end

# # (через массив)выполняется запрос селект с помощью команды execute
# db.execute 'select * from Users' do |row|
#       # параметр row содержит строку базы данных
#       # переменная row типа массив
#       # чтобы обратиться к переменной массива нужно использовать индекс 0,1,2,3
#       # puts row  # вывезти все данные
#       puts row[1] # появяться все имена из базы данных
#       # print "\t\t"
#       puts "Name: #{row[1]} Date: #{row[3]}" # появяться все имена из базы данных
#       puts '=========='
# end
