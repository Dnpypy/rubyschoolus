#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

# подгружаем библиотеку sqlite3
require 'sqlite3'

# Method validation data Options table in database
def is_barber_exists? base, param
	# 1 часть выражения base.execute()
	# 2 часть выражения length > 0
  base.execute('SELECT * FROM Barbers WHERE barber=?', [param]).length > 0
end

# Method add data to table in database
# seed наполнить
def seed_db base, options
  options.each do |option|
		# ! отрицание, если парихмахер не существует выполнить запрос
    if !is_barber_exists? @db, option
      base.execute 'INSERT INTO Barbers (barber) VALUES (?)', [option]
    end
  end
end


# создаем базу в файле barbershop.db
def get_db
		@db = SQLite3::Database.new 'barbershop.db'
		@db.results_as_hash = true
		return @db
end

# configure - при запуске программы
# before - при каждом обращении к программе

# Синтаксис before (в sinatra) - исполняет код
#  перед запросом - будет доступно во всех представлениях
# @barbers будет во всех представлениях
before do
	db = get_db
	@barbers = @db.execute 'SELECT * FROM Barbers'
end

# инициализация приложения(базы данных) при старте
# если файла barbershop.db нет, он будет создан в тек. каталоге приложения
configure do
		# @db = SQLite3::Database.new 'barbershop.db'
		# db = get_db
		get_db
		# создаем таблицы "Users", "Barbers"
		@db.execute 'CREATE TABLE IF NOT EXISTS
								"Users"
								(
									"Id" INTEGER PRIMARY KEY AUTOINCREMENT,
									"username" TEXT,
									"phone" TEXT,
									"datestamp" TEXT,
									"barber" TEXT,
									"color" TEXT
								)'
		@db.execute 'CREATE TABLE IF NOT EXISTS
								"Barbers"
								(
									"Id" INTEGER PRIMARY KEY AUTOINCREMENT,
									"barber" TEXT
								)'
		# наполнение
		seed_db @db, ['Foo', 'Faa', 'Moo', 'Zoo', 'Faz', 'Maz', 'Kraz']

	   @db.close
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
end

get "/about" do
	erb :about
end

get "/something" do
	erb :something
end

get "/contacts" do
	erb :contacts
end

get "/visit" do
	# Write to array data from database table Options
	 # get_db
	 # @barbers = @db.execute 'SELECT * FROM Barbers'
	 # @db.close

	 @title = "Форма заявки для Sinatra (Ruby)"

	erb :visit

end

post "/visit" do

	@username     = params[:username]
	@phone        = params[:phone]
	@datetime     = params[:datetime]
	# @mail         = params[:mail]
	@barber       = params[:barber]
	@color        = params[:color]

	# хэш
	hh = {    :username => "Введите имя",
	              :mail => "Введите почту @",
		           :phone => "Введите телефон",
		        :datetime => "Введите дату и время",
						:barber   => "Выберите парикмахера"
		 }


	@error = hh.select { |key, _| params[key] == ""}.values.join(", ")

	if @error != ""
		return erb :visit
	end

	@db = get_db
	@db.execute 'insert into
							Users
							(
								username,
								phone,
								datestamp,
								barber,
								color
							)

			values(?, ?, ?, ?, ?)',[@username, @phone, @datetime, @barber, @color]

	@db.execute 'insert into
							Barbers
							(
								barber
							)

			values(?)',[@barber]


	erb "ok this is username: #{@color_choice}, #{@username}, #{@phone}, #{@datetime}, #{@barber}"

end

get '/showusers' do
	# получаем объект базы данных
	@db = get_db
	# Выбирает (SELECT) ВСЕ записи из (FROM) таблицы tbl_name
	# и сортирует их (ORDER BY) по полю id в ОБРАТНОМ порядке.
	@results = @db.execute 'SELECT * FROM Users ORDER BY id DESC'
	@db.close

  erb :showusers
end
