require 'bookmark_list'

require 'pg'
RSpec.describe BookmarkList do
  describe '#all' do
    it 'shows a list in an array' do
      empty
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks VALUES (1,'http://www.google.com');")
      @bookmarks = BookmarkList.all
      expect(@bookmarks).to include('http://www.google.com')
    end
  end
end
