#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

# подгружаем библиотеку sqlite3
require 'sqlite3'

def get_db
		return SQLite3::Database.new 'barbershop.db'
end

# инициализация приложения(базы данных) при старте
# если файла barbershop.db нет, он будет создан в тек. каталоге приложения
configure do
		# @db = SQLite3::Database.new 'barbershop.db'
		db = get_db
		db.execute 'CREATE TABLE IF NOT EXISTS
								"Users"
								(
									"Id" INTEGER PRIMARY KEY AUTOINCREMENT,
									"username" TEXT,
									"phone" TEXT,
									"datestamp" TEXT,
									"barber" TEXT,
									"color" TEXT
								)'
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
end

get "/about" do
	# @error = "something wrong"
	erb :about
end

get "/something" do
	erb :something
end

get "/contacts" do
	erb :contacts
end

get "/visit" do
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
		        :datetime => "Введите дату и время"
		 }


	@error = hh.select { |key, _| params[key] == ""}.values.join(", ")

	if @error != ""
		return erb :visit
	end

	db = get_db
	db.execute 'insert into
							Users
							(
								username,
								phone,
								datestamp,
								barber,
								color
							)

			values(?, ?, ?, ?, ?)',[@username, @phone, @datetime, @barber, @color]


	erb "ok this is username: #{@color_choice}, #{@username}, #{@phone}, #{@datetime}, #{@barber}"

end

get '/showusers' do
  erb "Hello World"
end
