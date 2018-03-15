require 'sinatra/base'
require_relative './lib/link'
require_relative './lib/database_connection_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    @links_db = Link.all
    erb :homepage, :locals => {:invalid_link => false, :invalid_title => false}
  end

  post '/add_link' do
    @links_db = Link.all
    if Link.add_link(params[:new_link], params[:new_title])
      redirect '/'
    else
      erb :homepage, :locals => {:invalid_link => true, :invalid_title => false }
    end
  end

  post '/delete_link' do
    @links_db = Link.all
    if Link.delete_link(params[:delete_title])
      redirect '/'
    else
      erb :homepage, :locals => { :invalid_link => false, :invalid_title => true }
    end
  end

end
