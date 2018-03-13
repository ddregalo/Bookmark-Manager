require 'link'

describe Link do
  describe '#self.all' do
    it 'returns an array of links' do
      expect(Link.all).to include("http://www.ddregalo.com")
      expect(Link.all).to include("https://www.danielarsham.com")
      expect(Link.all).to include("http://basquiat.com")
    end
  end
end
