
#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get "/about" do
	erb :about
end

get "/visit" do
	erb :visit
end

get "/contacts" do
	erb :contacts
end


get "/something" do
	erb :something
end

get "/admin" do
	erb :admin
end

post "/admin" do

	@login = params[:login]
	@pass  = params[:pass]
	@username_limit = 20
	@pass_limit     = 20

	 
	# проверка на пустую строку
	if @login == "" # ||   
		@alert_message = "<p class='alert alert-danger' role='alert'>Пустая строка!!!</p>"
		# @check_mail = 
		erb :admin
	elsif @pass == ""
		@alert_message_2 = "<p class='alert alert-danger' role='alert'>Пустая строка!!!</p>"
		erb :admin
	
	# проверка на превышение лимита букв
	elsif @login.length >= @username_limit 
		@alert_message_3 = "<p class='alert alert-danger' role='alert'>Превышен лимит букв!!!</p>"
		erb :admin
	elsif @pass.length >= @pass_limit
		@alert_message_4 = "<p class='alert alert-danger' role='alert'>Превышен лимит букв!!!</p>"
		erb :admin
	else 
		@inner = "<p class='alert alert-success' role='alert'>Вы вошли!!!</p>"
	end

	
	erb :admin
	
end

post "/visit" do

	@login    = params[:login]
	@pass     = params[:pass]
	@mail     = params[:mail]
	@datetime = params[:datetime]
	@color    = params[:color]

	@message = "username:#{@login}, pass:#{@pass}, mail:#{@mail}, datetime: #{@datetime}, color_choice: #{@color}"


	File.open("./public/users.txt", "a") do |file|
		file.puts @message		
	end
	
	erb :visit

end


