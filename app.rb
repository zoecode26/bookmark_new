require 'sinatra/base'
require_relative 'lib/bookmark_list'

class BookmarkManager < Sinatra::Base

  get '/bookmarks' do
    @bookmark_list = BookmarkList.all
    erb :bookmarks
  end

  get '/form' do
    erb :form
  end

  post '/bookmarks' do
    @url = params[:url]
    BookmarkList.add(@url)
    redirect('/bookmarks')
  end

  run! if app_file == $0
end
