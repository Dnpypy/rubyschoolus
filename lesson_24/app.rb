#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

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
	
	@login    = params[:login]
	@phone    = params[:phone]
	@datetime = params[:datetime]
	@barber   = params[:barber]
	@color_choice = params[:color_choice]

	if @login == ""
		@error = "Введите имя"
		erb :visit  # or return visit
	else
		erb "ok this is username: #{@color_choice}, #{@login}, #{@phone}, #{@datetime}, #{@barber}"

	end

end

