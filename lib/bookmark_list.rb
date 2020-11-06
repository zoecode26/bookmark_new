require 'pg'

class BookmarkList
  attr_reader :id, :title, :url
  
  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks;")
    result.map do |bookmark|
      BookmarkList.new(bookmark['id'], bookmark['title'], bookmark['url'])
    end
  end

  def self.add(title, url)
    result = DatabaseConnection.query("INSERT INTO bookmarks(title, url) VALUES ('#{title}', '#{url}') RETURNING id, title, url;")
    BookmarkList.new(result[0]['id'], result[0]['title'], result[0]['url'])
  end

  def self.delete(title)
    result = DatabaseConnection.query("DELETE FROM bookmarks WHERE title = '#{title}'")
  end

  def self.update(id, title, url)
    result = DatabaseConnection.query("UPDATE bookmarks SET title = '#{title}', url = '#{url}' WHERE id = '#{id}'")
  end
end
