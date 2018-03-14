feature 'Adds a Link' do
  scenario 'fails valid url criteria' do
    visit('/')
    fill_in('new_link', with: 'not_valid')
    click_button 'Add Link'
    expect(page).to have_content 'Please enter a valid url'
  end
end
