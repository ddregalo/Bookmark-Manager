feature 'View All Links' do
  scenario 'should diplay all links' do
    visit '/'
    expect(page).to have_content "https://www.draw.io/"
    expect(page).to have_content "http://gothsuptrees.net/"
    expect(page).to have_content "https://www.google.co.uk/"
  end
end
