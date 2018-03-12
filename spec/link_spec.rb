require 'link'

describe Link do
  describe '#self.all' do
    it 'returns an array of links' do
      expect(Link.all).to include("http://www.draw.io")
      expect(Link.all).to include("http://www.makersacademy.com")
      expect(Link.all).to include("http://www.gothsuptrees.net")
    end
  end
end
