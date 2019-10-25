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
	erb "About"
end

get "/something" do
	erb "<h1>Something...</h1>"
end

post "/contacts" do

	login   = params[:login]
	# @mail    = params[:mail]
	message = params[:message]

	data_info = { :login   => "Enter login...",
	              :mail    => "Enter mail...",
	              :message => "You didn't enter a message!" }

	@error = data_info.select { |key, _| params[key] == ""}.values.join(", ")

	if @error != ""
		return erb :contacts
	end

Pony.mail({
  :to => '***1***@gmail.com',    # real mail 1
  :from => '***2***@gmail.com',  # real mail 2
  :via => :smtp,
  :subject => "New message from user: #{login}",
  :body => "#{message}",

  :via_options => {
    :address              => 'smtp.gmail.com',
    :port                 => '587',
    :enable_starttls_auto => true,
    :user_name            => '***2***@gmail.com', # real mail 2
    :password             => '**********',
    :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
    :domain               => "gmail.com" # the HELO domain provided by the client to the server
    # :openssl_verify_mode => 'none' 
  }
})
  erb :contacts
end