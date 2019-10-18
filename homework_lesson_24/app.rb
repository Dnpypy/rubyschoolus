#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require "pony"

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get "/contacts" do
	erb :contacts
end

get "/about" do
	erb "О нас"
end

get "/something" do
	erb "<h1>Что-то</h1>"
end

post "/contacts" do

	@login   = params[:login]
	@mail    = params[:mail]
	@message = params[:message]


	data_info = { :login   => "Введите логин",
	              :mail    => "Введите почту @",
	              :message => "Вы не ввели сообщение!" }

	# data_info.each do |key, value|

	# 	if params[key] == ""
	# 		@error = data_info[key]
	# 		return erb :contacts
	# 	end
	# end 

	@error = data_info.select { |key, _| params[key] == ""}.values.join(", ")

	if @error != ""
		return erb :contacts
	end

	erb "ok this is username: #{@login}, #{@mail}, #{@message}"


	# erb :contacts
end