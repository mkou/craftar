describe Craftar::Tag do
  before(:all) do
    Craftar.api_key = api_key
    @collection = Craftar::Collection.create(name: SecureRandom.hex(8))
  end

  after(:all) do
    @collection.destroy
  end

  describe 'create an tag' do
    it 'should create an online tag' do
      tag = Craftar::Tag.create(name: SecureRandom.hex(8), collection: @collection.resource_uri)
      expect(tag.uuid).not_to be_nil
    end
    context 'when the collection does not exist' do
      it 'should raise an error' do
        name = SecureRandom.hex(8)
        expect { Craftar::Tag.create(name: name, collection: 'abcd') }.to raise_error
      end
    end
  end

  describe 'find an tag' do
    context 'when the tag does not exist' do
      it 'should be nil' do
        expect(Craftar::Tag.find('abcd')).to be_nil
      end
    end

    context 'when the tag exists' do
      it 'should render the tag' do
        tag = Craftar::Tag.create(name: SecureRandom.hex(8), collection: @collection.resource_uri)
        expect(Craftar::Tag.find(tag.uuid).resource_uri).not_to be_nil
      end
    end
  end

  #describe 'update an tag' do
  #  it 'should update the tag' do
  #    tag = Craftar::Tag.create(name: SecureRandom.hex(8), collection: @collection.resource_uri)
  #    new_name = SecureRandom.hex(8)
  #    expect(tag.update(name: new_name).name).to eq new_name
  #  end
  #end

  describe 'delete an tag' do
    it 'should delete the tag' do
      tag = Craftar::Tag.create(name: SecureRandom.hex(8), collection: @collection.resource_uri)
      uuid = tag.uuid
      tag.destroy
      expect(Craftar::Tag.find(uuid)).to be_nil
    end
  end
end