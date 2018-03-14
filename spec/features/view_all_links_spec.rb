feature 'View All Links' do
  scenario 'should diplay all links' do
    visit '/'
    expect(page).to have_content "DD Regalo"
    expect(page).to have_content "Jean-Michel Basquiat"
    expect(page).to have_content "Daniel Arsham"
  end
end
