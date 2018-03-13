feature 'View All Links' do
  scenario 'should diplay all links' do
    visit '/'
    expect(page).to have_content "http://www.ddregalo.com"
    expect(page).to have_content "https://www.danielarsham.com"
    expect(page).to have_content "http://basquiat.com"
  end
end
