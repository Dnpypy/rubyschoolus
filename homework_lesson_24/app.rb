#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

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

