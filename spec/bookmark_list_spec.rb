require 'bookmark_list'

require 'pg'
RSpec.describe BookmarkList do
  describe '#all' do
    it 'shows a list of all bookmarks' do
      empty
      bookmark = BookmarkList.add('Google', 'https://www.google.com')
      BookmarkList.add('Facebook', 'https://www.facebook.com')

      bookmarks = BookmarkList.all

     expect(bookmarks.first).to be_a BookmarkList
     expect(bookmarks.first.id).to eq bookmark.id
     expect(bookmarks.first.title).to eq 'Google'
     expect(bookmarks.first.url).to eq 'https://www.google.com'
     expect(bookmarks.last.title).to eq 'Facebook'
     expect(bookmarks.last.url).to eq 'https://www.facebook.com'
    end
  end

  describe '#add' do
    it 'creates a new bookmark' do
      empty
      bookmark = BookmarkList.add('Facebook', 'https://www.facebook.com')
      expect(bookmark.title).to eq 'Facebook'
      expect(bookmark.url).to eq 'https://www.facebook.com'
    end
  end

  describe '#delete' do
    it 'deletes a bookmark' do
      empty
      bookmark_fb = BookmarkList.add('Facebook', 'https://www.facebook.com')
      bookmark_yt = BookmarkList.add('Youtube', 'https://www.youtube.com')
      BookmarkList.delete('Facebook')
      expect(BookmarkList.all.length).to eq 1
    end
  end

  describe '.update' do
    it 'updates the bookmark with the given data' do
      empty
      bookmark = BookmarkList.add('Twitter', 'http://www.twitter.com')
      updated_bookmark = BookmarkList.update(bookmark.id, 'Amazon', 'http://www.amazon.com')

      expect(BookmarkList.all.length).to eq 1
      expect(BookmarkList.all.first.title).not_to eq('Twitter')
      expect(BookmarkList.all.first.url).not_to eq('http://www.twitter.com')
      expect(BookmarkList.all.first.title).to eq('Amazon')
      expect(BookmarkList.all.first.url).to eq('http://www.amazon.com')
    end
  end
end
