require 'sinatra/base'
require_relative './lib/link'
require_relative './lib/database_connection_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    @links_db = Link.all
    erb :homepage, :locals => {:invalid_link => false}
  end

  post '/add_link' do
    @links_db = Link.all
    if Link.add_link(params[:new_link])
      redirect '/'
    else
      erb :homepage, :locals => {:invalid_link => true}
    end
  end

end
