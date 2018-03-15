feature 'Delete Link' do
  scenario 'Invalid title does not exist' do
    visit('/')
    fill_in('delete_title', with: 'Test')
    click_button('Delete')
    expect(page).to have_content 'URL Title is not in your bookmarks'
  end
end
