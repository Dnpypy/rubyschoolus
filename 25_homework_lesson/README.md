Урок 25

    Установить визуальную программу для работы с БД.
    Создать БД BarberShop
    Создать таблицы:

    Таблица 1. Users 
        Id - идентификатор, primary key, автоинкремент, тип Integer
        Name - varchar
        Phone - varchar
        DateStamp - varchar
        Barber - varchar
        Color - varchar

    Таблица 2. Contacts
        Id - идентификатор, primary key, автоинкремент, тип Integer
        Email - varchar
        Message - varchar

Добавить несколько записей с помощью консоли sqlite3 в таблицы Users и Contacts. Если не получится, создать БД в блокноте и скопировать в sqlite3 вручную по аналогии с запросом CREATE TABLE "Cars" ("Id" INTEGER PRIMARY KEY AUTOINCREMENT, "Name" VARCHAR, "Price" INTEGER)

