feature "Bookmarks displayed to user" do
  scenario 'viewing bookmarks' do
    visit('/bookmarks')
    empty
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks VALUES (1,'http://www.google.com');")
    expect(page).to have_content('http://www.google.com')
  end
end

feature "Saving websites to bookmark manager" do
  scenario 'adding bookmarks' do
    visit('/bookmarks')
    empty
    click_on 'Add bookmark'
    fill_in "url", with: 'http://www.instagram.com'
    click_button 'submit'
    expect(page).to have_content('http://www.instagram.com')
  end
end
