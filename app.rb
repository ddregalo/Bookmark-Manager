require 'sinatra/base'
require_relative './lib/link'
require_relative './lib/database_connection_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    @links_db = Link.all
    erb :homepage, :locals => {
      :invalid_link => false,
      :invalid_title => false,
      :update_status => false
    }
  end

  post '/add_link' do
    @links_db = Link.all
    if Link.add_link(params[:new_link], params[:new_title])
      redirect '/'
    else
      erb :homepage, :locals => {
        :invalid_link => true,
        :invalid_title => false,
        :update_status => false
      }
    end
  end

  post '/delete_link' do
    @links_db = Link.all
    if Link.delete_link(params[:delete_title])
      redirect '/'
    else
      erb :homepage, :locals => {
        :invalid_link => false,
        :invalid_title => true,
        :update_status => false
      }
    end
  end

  post '/update_title' do
    @links_db = Link.all
    Link.set_update_title(params[:old_title])
    erb :homepage, :locals => {
      :update_status => true,
      :invalid_link => false,
      :invalid_title => false
    }
  end

  post '/update_link' do
    @links_db = Link.all
    Link.update_link(params[:new_update_link], params[:new_update_title])
    redirect '/'
  end
end
