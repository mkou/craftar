describe Craftar::CollectionBundle do
  before(:all) do
    Craftar.api_key = api_key
    @collection = Craftar::Collection.create(name: SecureRandom.hex(8))
    @app =  Craftar::App.create(name: SecureRandom.hex(8), collection: @collection.resource_uri)
    @version_uri = Craftar::SdkVersion.list[:objects].first.resource_uri
  end

  after(:all) do
    @app.destroy
    @collection.destroy
  end

  describe 'create a collection bundle' do
    it 'should create an online collection bundle' do
      collection_bundle = Craftar::CollectionBundle.create(collection: @collection.resource_uri, version: @version_uri, app: @app.resource_uri)
      expect(collection_bundle.uuid).not_to be_nil
    end
    #context 'when the collection does not exist' do
    #  it 'should raise an error' do
    #    expect { Craftar::CollectionBundle.create(collection: 'abcd', version: @version_uri, app: @app.resource_uri) }.to raise_error
    #  end
    #end
    #context 'when the app does not exist' do
    #  it 'should raise an error' do
    #    expect { Craftar::CollectionBundle.create(collection: @collection.resource_uri, version: @version_uri, app: 'abcd') }.to raise_error
    #  end
    #end
    #context 'when the version does not exist' do
    #  it 'should raise an error' do
    #    expect { Craftar::CollectionBundle.create(collection: @collection.resource_uri, version: 'abcd', app: @app.resource_uri) }.to raise_error
    #  end
    #end
  end

  describe 'find an collection_bundle' do
    context 'when the collection_bundle does not exist' do
      it 'should be nil' do
        expect(Craftar::CollectionBundle.find('abcd')).to be_nil
      end
    end

    context 'when the collection_bundle exists' do
      it 'should render the collection_bundle' do
        collection_bundle = Craftar::CollectionBundle.create( collection: @collection.resource_uri, version: @version_uri, app: @app.resource_uri)
        expect(Craftar::CollectionBundle.find(collection_bundle.uuid).resource_uri).not_to be_nil
      end
    end
  end

  #describe 'delete an collection_bundle' do
  #  it 'should delete the collection_bundle' do
  #    collection_bundle = Craftar::CollectionBundle.create( collection: @collection.resource_uri, version: @version_uri, app: @app.resource_uri)
  #    uuid = collection_bundle.uuid
  #    expect(Craftar::CollectionBundle.find(uuid)).to be_nil
  #  end
  #end
end