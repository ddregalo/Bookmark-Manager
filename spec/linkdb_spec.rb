require 'linkdb'

describe LinkDb do

  describe '#all' do
    it 'returns an array of links' do
      expect(subject.all[0].class.to_s).to eq 'Link'
    end
  end

end
