require 'pg'

class BookmarkList

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
  end

  def self.all
    connection = connect
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end

  def self.add(url)
    connection = connect
    connection.exec("INSERT INTO bookmarks(url) VALUES ('#{url}');")
  end
end
