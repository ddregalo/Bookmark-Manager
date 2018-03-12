require 'sinatra/base'
require_relative './lib/link'

class BookmarkManager < Sinatra::Base

  get '/' do
    @link_db = Link.all
    erb :homepage
  end
end
