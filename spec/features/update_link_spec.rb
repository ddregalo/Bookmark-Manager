feature 'Updates Link' do
  scenario 'Step 1 to select title of link to update' do
    visit("/")
    fill_in('old_title', with: 'DD Regalo')
    click_button 'Update'
    expect(page).to have_content 'Please update url and title //'
  end

  scenario 'Step 2 input new url and title for link' do
    visit("/")
    fill_in('old_title', with: 'DD Regalo')
    click_button 'Update'
    fill_in('new_update_link', with: 'http://www.ddregalo.com')
    fill_in('new_update_title', with: 'Dd Regalo Art')
    click_button 'Update Bookmark'
    expect(page).to have_content 'Dd Regalo Art'
  end
end
