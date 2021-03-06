require 'link'

describe Link do
  describe '.all' do
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

  describe '.add_link' do
    context 'Valid input URL' do
      it 'calls query method with SQL to add url and title' do
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

  describe '.delete_link' do
    context 'Valid title to delete' do
      it 'calls query method with sql to delete title' do
        valid_title = "DD Regalo"
        Link.delete_link(valid_title)
        links = Link.all
        all_titles = links.map { |link| link.title }
        # expect(DatabaseConnection).to receive(:query).with("DELETE FROM links WHERE title = '#{valid_title}';")
        expect(all_titles).not_to include "DD Regalo"
      end
    end

    context 'Invalid title to delete' do
      it 'returns false if title input is not included in title list' do
        invalid_title = "Totally Invalid"
        expect(Link.delete_link(invalid_title)).to eq false
      end
    end
  end

  describe '.set_update_title' do
    context 'Sets the title of the link to update' do
      it 'should record the title to be updated to instance variable' do
        old_title = "DD Regalo"
        expect(Link.set_update_title(old_title)).to eq old_title
      end
    end
  end

  describe '.update_link' do
    context 'Update valid link and title' do
      it 'calls query method with sql to update the selected link' do
        old_title = 'DD Regalo'
        valid_title = "Dd Regalo Art"
        valid_link = "http://www.ddregalo.com"
        expect(DatabaseConnection).to receive(:query).with("UPDATE links SET url = '#{valid_link}', title = '#{valid_title}' WHERE title = '#{old_title}';")
        Link.update_link(valid_link, valid_title)
      end
    end
  end
end
