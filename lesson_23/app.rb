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

post "/visit" do
	
	@login    = params[:login]
	@phone    = params[:phone]
	@datetime = params[:datetime]
	@barber   = params[:barber]

	erb "ok this is username: #{@login}, #{@phone}, #{@datetime}, #{@barber}"
end

