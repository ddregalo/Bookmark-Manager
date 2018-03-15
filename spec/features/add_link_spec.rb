feature 'Adds a Link' do
  scenario 'adds a link with a form' do
    visit('/')
    fill_in('new_link', with: 'http://www.warhol.org')
    fill_in('new_title', with: 'Andy Warhol')
    click_button 'Add Link'
    expect(page).to have_content 'Andy Warhol'
  end
end
