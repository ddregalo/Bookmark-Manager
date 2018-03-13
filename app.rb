require 'sinatra/base'
require_relative './lib/link'

class BookmarkManager < Sinatra::Base

  get '/' do
    p ENV
    @link_db = Link.all
    erb :homepage
  end
end
