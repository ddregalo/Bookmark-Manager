require 'database_connection'

describe 'Database Connection' do

  describe '#self.setup' do
    it 'should set up connection to db with pg' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  describe '#self.query' do
    it 'allows sql to be executed on the setup connection' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(connection).to receive(:exec).with("SELECT * FROM links;")
      DatabaseConnection.query("SELECT * FROM links;")
    end
  end
end
