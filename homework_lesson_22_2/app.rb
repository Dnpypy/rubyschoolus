# encoding: utf-8

require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'


configure do
  enable :sessions
end

helpers do
  def username
    session[:identity] ? session[:identity] : 'Hello stranger'
  end
end

before '/secure/*' do
  unless session[:identity]
    session[:previous_url] = request.path
    @error = 'Sorry, you need to be logged in to visit ' + request.path
    halt erb(:login_form)
  end
end

get '/' do
	@hello = "Привествую!!!!!!!!!!!!!!!!!!!!!!!!!!"
  	erb 'Can you handle a <a href="/secure/place">secret</a>?'
end

get '/login/form' do
  erb :login_form
end

post '/login/attempt' do

	@login       = params[:login]
	@pass        = params[:pass]
	@phone       = params[:phone]
	@time_write  = params[:time_write]

	if @login == "admin" && @pass == "123"
  		
		session[:identity] = params['login']
  	end

	where_user_came_from = session[:previous_url] || '/'
  	redirect to where_user_came_from

end

get '/logout' do
  session.delete(:identity)
  erb "<div class='alert alert-message'>Logged out</div>"
end

get '/secure/place' do
  erb 'This is a secret place that only <%=session[:identity]%> has access to!'
end

get "/about" do
  @gg = "Чтото передаем..."
  erb :about
end

get "/contacts" do
  @gg = "Чтото передаем в контакты..."
  erb :contacts
end

get "/visits" do
  	erb :visits
end

post "/visits" do

	File.open("./public/contacts.txt", "r") do |line|  
		@logfile = line.readlines
	end

	erb :visits

end

post "/contacts" do
	
	@mail    = params[:mail]
	@message = params[:message]
	@barber  = params[:barber]

	if @mail == ""
		@check_mail = "<p class='alert alert-danger' role='alert'>Введите почту</p>"
	end
	
	File.open("./public/contacts.txt", "a") do  |file|
		file.print "\n@mail: #{@mail}\t" + " @barber: #{@barber}\n" + "@message: #{@message}"
		file.puts ""
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
		
		File.open("./public/contacts.txt", "r") do |file|
			@logfile = file.readlines
		end

		erb :visits
	
	elsif @user_admin == "admin" && @password == "admin"  
		@check_admin = "Нет не тот логин и пароль!" 
		erb :admin
	else
		erb :admin

	end

end
