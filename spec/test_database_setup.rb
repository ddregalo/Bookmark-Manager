require 'pg'

p "Setting Up Test Database..."

# connect to the test database
connection = PG.connect(dbname: 'bookmark_manager_test')

connection.exec("TRUNCATE links;") # clear the database

# input test data into the database
connection.exec("INSERT INTO links VALUES(1, 'http://www.ddregalo.com');")
connection.exec("INSERT INTO links VALUES(2, 'http://basquiat.com');")
connection.exec("INSERT INTO links VALUES(3, 'https://www.danielarsham.com');")
