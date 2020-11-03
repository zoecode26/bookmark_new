require 'pg'

class BookmarkList

  def self.test?
    'bookmark_manager_test' if ENV['ENVIRONMENT'] == 'test'
    'bookmark_manager'
  end

  def self.all
    connection = PG.connect(dbname: test?)
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end

  def self.add(url)
    connection = PG.connect(dbname: test?)
    connection.exec("INSERT INTO bookmarks(url) VALUES ('#{url}');")
  end
end
