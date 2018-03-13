require 'pg'
require_relative 'database_connection'

class Link

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map { |link| link['url'] }
  end

  def self.add_link(new_link)
    DatabaseConnection.query("INSERT INTO links(url) VALUES('#{new_link[:url]}')")
  end

end
