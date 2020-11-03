feature "Content displayed correctly to user" do
  scenario 'title displayed' do
    visit('/bookmarks')
    expect(page).to have_content('Bookmarks')
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
