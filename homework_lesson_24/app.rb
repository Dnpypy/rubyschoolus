if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end


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


	@error = data_info.select { |key, _| params[key] == ""}.values.join(", ")

	if @error != ""
		return erb :contacts
	end


Pony.mail({
	       :to      => 'test.test5847@gmail.com',
		   :from    => "#{@mail}",
		   :via     => :smtp,
		   :subject => "Новое сообщение от пользователя #{@login}",
		   :body    => "#{@message}",
		   
		    :via_options => {
		    
		    :address              => 'smtp.gmail.com',
		    :port                 => '587',
		    :enable_starttls_auto => true,
		    :user_name            => 'testing879456',
		    :password             => 'ZM542352soJPD9Ayr',
		    :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
		    :domain               => "localhost" # the HELO domain provided by the client to the server
		  }
		})
		  erb :contacts

end