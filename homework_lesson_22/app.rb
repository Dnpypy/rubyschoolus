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
		@message = "login: #{@login}, mail: #{@mail}, phone: #{@phone}, datetime: #{@datetime}"

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

