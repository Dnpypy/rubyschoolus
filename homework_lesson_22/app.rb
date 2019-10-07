#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>!!!"			
end

# обработчик запроса get
get "/about" do
	erb :about
end

get "/visit" do
	erb :visit
end

post "/visit" do
	
	@login = params[:login]
	@mail = params[:mail]
	@phone = params[:phone]
	@datetime = params[:datetime]

	@x = @login.class
	@message = "login: #{@login}, pass: #{@mail}, phone: #{@phone}, datetime: #{@datetime}"

	File.open("./public/users.txt", "a") do |file|
		file.puts @message
	end

	if @login == ""
		@user = "Введите пользователя!" 
		erb :visit
	elsif @mail == ""
		@mail = "Введите почту!" 
		erb :visit
	elsif @phone == ""
		@phone = "Введите телефон!" 
		erb :visit
	else
		@welcome = "Вы успешно записались!"
		erb :complete
	end
end

get "/contacts" do
	erb :contacts
end


