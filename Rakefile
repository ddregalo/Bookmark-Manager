require 'pg'

namespace :database do
  desc 'creates the databases require for the project'
  task :database_setup do
    p "Creating necassary databases..."

    databases = ['bookmark_manger_test','bookmark_manager']

    databases.each do |database|
    connection = PG.connect(dbname: 'postgres')
    connection.exec "CREATE DATABASE #{database}"
    connection = PG.connect(dbname: database)
    connection.exec "CREATE TABLE links(
      id SERIAL PRIMARY KEY,
      url VARCHAR(60)
      )"
    end

  end

  desc 'sets up the test database for ready for rspec'
  task :database_test_setup do
    p "Setting Up Test Database..."

    # connect to the test database
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("TRUNCATE links;") # clear the database

    # input test data into the database
    connection.exec("INSERT INTO links VALUES(1, 'http://www.ddregalo.com');")
    connection.exec("INSERT INTO links VALUES(2, 'http://basquiat.com');")
    connection.exec("INSERT INTO links VALUES(3, 'https://www.danielarsham.com');")
  end
end
