require 'link'

describe Link do
  describe '#self.all' do
    it 'returns an array of links' do
      expect(Link.all).to include("http://www.ddregalo.com")
      expect(Link.all).to include("https://www.danielarsham.com")
      expect(Link.all).to include("http://basquiat.com")
    end
  end

  describe '#self.add_link' do
    context 'Valid input URL' do
      it 'calls query method with SQL' do
        valid_link = "http://ricky.hewitt.tech"
        expect(DatabaseConnection).to receive(:query).with("INSERT INTO links(url) VALUES('#{valid_link}')")
        Link.add_link(valid_link)
      end
    end

    context 'Invalid input URL' do
      it 'returns false' do
        invalid_link = "???"
        expect(Link.add_link(invalid_link)).to eq false
      end
    end
  end
end
