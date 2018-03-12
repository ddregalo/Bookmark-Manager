feature 'View All Links' do
  scenario 'should diplay all links' do
    visit '/'
    expect(page).to have_content "http://www.draw.io"
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.gothsuptrees.net"
  end
end
