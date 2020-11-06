require 'sinatra/base'
require_relative 'lib/bookmark_list'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base

  get '/bookmarks' do
    @bookmark_list = BookmarkList.all
    erb :bookmarks
  end

  get '/form' do
    erb :form
  end

  get '/button' do
    if params[:action] == "Delete"
      title = params[:title]
      BookmarkList.delete(title)
      redirect('/bookmarks')
    end

    if params[:action] == "Edit"
      @id = params[:id]
      @title = params[:title]
      @url = params[:url]
      erb :edit
    end
  end

  post '/bookmarks' do
    title = params[:title]
    url = params[:url]
    BookmarkList.add(title, url)
    redirect('/bookmarks')
  end

  post '/update' do
    id = params[:id]
    title = params[:title]
    url = params[:url]
    BookmarkList.update(id, title, url)
    redirect('/bookmarks')
  end

  run! if app_file == $0
end
