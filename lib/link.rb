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
    return false unless uri?(link)
    DatabaseConnection.query("INSERT INTO links(url,title) VALUES('#{link}','#{title}')")
  end

  def self.delete_link(title)
    return false unless title_exists?(title)
    DatabaseConnection.query("DELETE FROM links WHERE title = '#{title}';")
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

  def self.title_exists?(title)
    test_title = DatabaseConnection.query("SELECT * FROM links")
    title_array = test_title.map { |link| link['title'] }
    title_array.include?(title)
  end
end

# WHERE title ='#{title}'")
