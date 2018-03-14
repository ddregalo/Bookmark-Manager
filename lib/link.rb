require 'pg'
require_relative 'database_connection'
require 'uri'

class Link

  attr_reader :id, :url, :title

  def initialize(id,url,title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map { |link| Link.new(link['id'],link['url'],link['title']) }
  end

  def self.add_link(link,title)
    return false if uri?(link) == false
    DatabaseConnection.query("INSERT INTO links(url,title) VALUES('#{link}','#{title}')")
  end

  private
  def self.uri?(string)
    uri = URI.parse(string)
    %w( http https ).include?(uri.scheme)
  rescue URI::BadURIError
    false
  rescue URI::InvalidURIError
    false
  end
end
