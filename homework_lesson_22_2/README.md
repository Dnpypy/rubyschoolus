Hello!
====

This is a demonstrator for [Sinatra](http://www.sinatrarb.com/) and [Twitter Bootstrap](http://getbootstrap.com/).

Use it as a boilerplate to start your own apps.

Go!
===

Download and run sinatra-bootstrap:

    git clone https://github.com/bootstrap-ruby/sinatra-bootstrap

    cd sinatra-bootstrap
    bundle install             # To install sinatra

    bundle exec ruby app.rb    # To run the sample

Then open [http://localhost:4567/](http://localhost:4567/)

What's next?
============
- Try the rerun gem to restart Sinatra automatically when you change source files: https://github.com/alexch/rerun

Урок 22

    Программа-минимум:
        Добавить post-обработчик для /visit
        Добавить все введенные данные в ./public/users.txt
        Добавить страницу /contacts со следующими полями:
            email
            сообщение (посмотреть html-элемент textarea)

            все сохраненные контакты должны добавляться в ./public/contacts.txt.

    Программа-максимум:
        На странице /visit пользователь должен иметь возможность выбрать парикмахера из списка:
            Walter White
            Jessie Pinkman
            Gus Fring

            Необходимо использовать html-контрол (тег), который называется select.

        Программа должна сохранять введенные данные в тот же файл.

    Домашнее задание супер-максимум: Сделать то, что было задано на 21 урок (вход по логину и по паролю с помощью sinatra-bootstrap) - для тех, кто не сделал.
