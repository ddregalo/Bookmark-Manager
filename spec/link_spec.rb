require 'link'

describe Link do
  describe '#self.all' do
    it 'returns an array of links' do
      expect(Link.all).to match_array([
        "https://www.draw.io/",
        "https://www.google.co.uk/",
        "http://gothsuptrees.net/"
      ])
    end
  end
end
