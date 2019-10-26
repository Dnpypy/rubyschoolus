#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

# подгружаем базу данных
require 'sqlite3'

# инициализация приложения(базы данных) при старте
# если файла barbershop.db нет, он будет создан в тек. каталоге приложения
configure do
		@db = SQLite3::Database.new 'barbershop.db'
		@db.execute 'CREATE TABLE IF NOT EXISTS
								"Users"
								(
									"Id" INTEGER PRIMARY KEY AUTOINCREMENT,
									"login" TEXT,
									"phone" TEXT,
									"datestamp" TEXT,
									"barber" TEXT,
									"color_choice" TEXT
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

	@login        = params[:login]
	@phone        = params[:phone]
	@datetime     = params[:datetime]
	# @mail         = params[:mail]
	@barber       = params[:barber]
	@color_choice = params[:color_choice]

	# хэш
	hh = {    :login => "Введите имя",
	           :mail => "Введите почту @",
		      :phone => "Введите телефон",
		   :datetime => "Введите дату и время"
		 }

	# # для каждой пары ключ значение
 #    hh.each do |key, value|

 #    	# key == :login , key == :phone и т.д.
 #    	# если параметр пуст
 #    	if params[key] == ""
 #    		# переменной error присвоить значение value из хэша hh
 #    		# а value из хэша hh сообщение об ошибке
 #    		# т.е. переменной error присвоить сообщение об ошибке
 #    		@error = hh[key]
 #    		# вернуть представление visit
 #    		return erb :visit
	# 	end
	# end

	# выводит если не ввели n-e количество параметров
	# Для получения отдельно массива ключей или значений существуют методы .keys и .values.
	# .join соединяем их через запятую ", "
	@error = hh.select { |key, _| params[key] == ""}.values.join(", ")

	if @error != ""
		return erb :visit
	end

	erb "ok this is username: #{@color_choice}, #{@login}, #{@phone}, #{@datetime}, #{@barber}"



end
