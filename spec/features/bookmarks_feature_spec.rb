feature "Content displayed correctly to user" do
  scenario 'title displayed' do
    visit('/bookmarks')
    expect(page).to have_content('Bookmarks')
  end
end

feature "Viewing bookmarks" do
  scenario 'User can see all bookmarks displayed on page' do
    BookmarkList.add('Twitter','http://www.twitter.com')
    BookmarkList.add('Youtube','http://www.youtube.com')

    visit ('/bookmarks')

    expect(page).to have_link('Twitter', href: 'http://www.twitter.com')
    expect(page).to have_link('Youtube', href: 'http://www.youtube.com')
    end
end

feature "Saving websites to bookmark manager" do
  scenario 'adding bookmarks' do
    visit('/bookmarks')
    empty
    click_on 'Add bookmark'
    fill_in "title", with: 'Instagram'
    fill_in "url", with: 'http://www.instagram.com'
    click_button 'Submit'

    expect(page).to have_link('Instagram', href: 'http://www.instagram.com')
  end
end

feature "Saving websites to bookmark manager" do
  scenario 'deleting bookmarks' do
    visit('/bookmarks')
    empty
    click_on 'Add bookmark'
    fill_in "title", with: 'Instagram'
    fill_in "url", with: 'http://www.instagram.com'
    click_button 'Submit'
    expect(page).to have_link('Instagram', href: 'http://www.instagram.com')
    click_button 'Delete'
    expect(page).not_to have_link('Instagram', href: 'http://www.instagram.com')
  end
end

feature 'Updating a bookmark' do
  scenario 'A user can update a bookmark' do
    empty
    bookmark = BookmarkList.add('Makers', 'http://www.makersacademy.com')
    visit('/bookmarks')
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')

    click_button 'Edit'

    fill_in('url', with: "http://www.bud.co.uk")
    fill_in('title', with: "Bud")
    click_button('Submit')

    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Bud', href: 'http://www.bud.co.uk')
  end
end
