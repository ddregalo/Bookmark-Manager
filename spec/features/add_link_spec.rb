feature 'Adds a Link' do
  scenario 'adds a link with a form' do
    visit('/')
    fill_in('new_link', with: 'http://www.warhol.org')
    click_button 'Add Link'
    expect(page).to have_content 'Andy Warhol'
  end
end
