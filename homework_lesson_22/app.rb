#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>!!!"			
end

get "/about" do
	erb :about
end

get "/visit" do
	erb :visit
end

post "/visit" do
	
	@barber   = params[:barber]
	@login    = params[:login]
	@mail     = params[:mail]
	@phone    = params[:phone]
	@datetime = params[:datetime]

	if @login == ""
		@check_user = "Введите пользователя!" 
		erb :visit
	
	elsif @mail == "" 
		@check_mail = "Введите почту!" 
		erb :visit
	
	elsif @phone == ""
		@check_phone = "Введите телефон!" 
		erb :visit
	
	elsif @datetime == ""
		@check_date = "Введиту дату прибытия!" 
		erb :visit
	
	else
		@message = "barber: #{@barber}, login: #{@login}, mail: #{@mail}, phone: #{@phone}, datetime: #{@datetime}"

		File.open("./public/users.txt", "a") do |file|
			file.puts @message
		end

		@welcome = "Вы успешно записались!"
		erb :complete
	end

end

get "/contacts" do
	erb :contacts
end

post "/contacts" do
	
	@mail     = params[:mail]
	@message  = params[:message]

	if @mail == "" 
		@check_mail = "Введите почту!" 
		erb :contacts

	else
		@input_mail    = "mail: #{@mail}"
		@text_message  = "text_message: #{@message}"

		File.open("./public/contacts.txt", "a") do |file|
			file.puts @input_mail
			file.puts @text_message
		end
	end

	erb :contacts
end

get "/admin" do
	erb :admin
end

post "/admin" do

	@user_admin = params[:user_admin]
	@password   = params[:password]

	if @user_admin == "admin" && @password == "secret"  
		# @check_admin = "Вы вошли в панель управления!" 
		erb :admin_panel #?
	
	elsif @user_admin == "admin" && @password == "admin"  
		@check_admin = "Нет не тот логин и пароль!" 
		erb :admin
	
	end
end

get "/admin_panel" do
	erb :admin_panel
end