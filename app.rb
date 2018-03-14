require 'sinatra/base'
require_relative './lib/link'
require_relative './lib/database_connection_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    @links_db = Link.all
    erb :homepage
  end

  post '/add_link' do
    Link.add_link(params[:new_link])
    redirect '/'
  end
end
