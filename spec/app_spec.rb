describe Craftar::App do
  before(:all) do
    Craftar.api_key = api_key
    @collection = Craftar::Collection.create(name: SecureRandom.hex(8))
  end

  after(:all) do
    @collection.destroy
  end

  describe 'create an app' do
    it 'should create an online app' do
      app = Craftar::App.create(collection: @collection.resource_uri, name: SecureRandom.hex(8))
      expect(app.uuid).not_to be_nil
    end
    context 'when the collection does not exist' do
      it 'should raise an error' do
        expect { Craftar::App.create(collection: 'abcd', name: SecureRandom.hex(8)) }.to raise_error
      end
    end
  end

  describe 'find an app' do
    context 'when the app does not exist' do
      it 'should be nil' do
        expect(Craftar::App.find('abcd')).to be_nil
      end
    end

    context 'when the app exists' do
      it 'should render the app' do
        app = Craftar::App.create( collection: @collection.resource_uri, name: SecureRandom.hex(8))
        expect(Craftar::App.find(app.uuid).resource_uri).not_to be_nil
      end
    end
  end
end