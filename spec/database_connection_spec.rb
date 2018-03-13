require 'database_connection'

describe 'Database Connection' do

  describe '#self.setup' do
    it 'should set up connection to db with pg' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  describe '#self.connection' do
    it 'confirms the connection is the one we set in setup' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end
end
