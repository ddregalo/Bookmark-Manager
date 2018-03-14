feature 'Adds a Link' do
  scenario 'adds a link with a form' do
    visit('/')
    fill_in('new_link', with: 'not_valid')
    click_button 'Add Link'
    expect(page).to have_content 'Please enter a valid url'
  end
end
