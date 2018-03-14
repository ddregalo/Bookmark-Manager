require 'pg'
require_relative 'database_connection'
require 'uri'

class Link

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map { |link| link['url'] }
  end

  def self.add_link(new_link)
    return false if uri?(new_link) == false
    DatabaseConnection.query("INSERT INTO links(url) VALUES('#{new_link}')")
  end

  def self.uri?(string)
    uri = URI.parse(string)
    %w( http https ).include?(uri.scheme)
  rescue URI::BadURIError
    false
  rescue URI::InvalidURIError
    false
  end
end
