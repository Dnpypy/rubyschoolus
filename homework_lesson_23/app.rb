
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

post "/visit" do

	@login    = params[:login]
	@pass     = params[:pass]
	@mail     = params[:mail]
	@datetime = params[:datetime]
	@color    = params[:color]

	# erb "ok this is username:#{@login}, pass:#{@pass}, 
	# mail:#{@mail}, datetime: #{@datetime}, color_choice: #{@color}"

	@message = "username:#{@login}, pass:#{@pass}, mail:#{@mail}, datetime: #{@datetime}, color_choice: #{@color}"

	# unless File.include?("./public/users.txt")

	File.open("./public/users.txt", "a") do |file|
		file.puts @message		
	end
	# end
	# erb "Complete write!"
	erb :visit

end


