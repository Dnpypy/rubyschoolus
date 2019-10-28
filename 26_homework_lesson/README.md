Barbershop.
=======================

this folder github rubyschool-us:
git clone https://github.com/rubyschool-us/sinatra-bootstrap-clean.git

this folder cleaned github bootstrap-ruby: 
Cleaned version of https://github.com/bootstrap-ruby/sinatra-bootstrap

    edit GEMFILE                     # gem 'sinatra-contrib' # To work reloader
    
    edit GEMFILE                     # gem 'sqlite3'         # To work sqlite db
	
    bundle install                   # To install sinatra bundle

    bundle exec ruby app.rb    # To run the sample cmd window

    did not work datetimepicker, took from here the "public" folder for work:
    https://github.com/rubyschool-us/rubyschool-barbershop-hq

Урок 26

    1.Сделать страницу /showusers, которая выводит информацию из базы данных со
    списком пользователей.
    Использовать запрос: select*from Users order by id desc -- кто не знает,
    сделать и догадаться, что он делает.
    
    2.(на подумать)
    В методе configure сделать дополнительную таблицу Barbers для хранения списка парикмахеров. Загружать список парикмахеров в методе configure. Сделать так, чтобы парикмахеры вставлялись в таблицу, но 1 раз.
    
    3.(кто сделал 2). 
    В представлении visit.erb изменить что-то в строках 38-45 и выводить 
    список парикмахеров из БД.

