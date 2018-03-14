require 'link'

describe Link do
  describe '#self.all' do
    it 'returns an array of link instances' do
      expect(Link.all[0]).to be_an_instance_of(Link)
    end

    it 'returned links have an id value' do
      expect(Link.all[0].id).to eq('1')
    end

    it 'returned links have an url value' do
      expect(Link.all[1].url).to eq('http://basquiat.com')
    end

    it 'returned links have an title value' do
      expect(Link.all[2].title).to eq('Daniel Arsham')
    end
  end

  describe '#self.add_link' do
    context 'Valid input URL' do
      it 'calls query method with SQL' do
        valid_link = "http://ricky.hewitt.tech"
        title = 'Ricky Hewitt'
        expect(DatabaseConnection).to receive(:query).with("INSERT INTO links(url,title) VALUES('#{valid_link}','#{title}')")
        Link.add_link(valid_link,title)
      end
    end

    context 'Invalid input URL' do
      it 'returns false' do
        invalid_link = "???"
        title = 'HELLOWORLD'
        expect(Link.add_link(invalid_link,title)).to eq false
      end
    end
  end
end
