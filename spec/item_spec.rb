describe Catchoom::Item do
  before(:all) do
    Catchoom.api_key = api_key
    @collection = Catchoom::Collection.create(name: SecureRandom.hex(8))
  end

  after(:all) do
    @collection.destroy
  end

  describe 'create a item' do
    it 'should create an online item' do
      item = Catchoom::Item.create(name: SecureRandom.hex(8), collection: @collection.resource_uri)
      expect(item.uuid).not_to be_nil
      item.destroy
    end
    context 'when the collection does not exist' do
      it 'should raise an error' do
        name = SecureRandom.hex(8)
        expect { Catchoom::Item.create(name: name, collection: 'abcd') }.to raise_error
      end
    end
  end

  describe 'find a item' do
    context 'when the item does not exist' do
      it 'should be nil' do
        expect(Catchoom::Item.find('abcd')).to be_nil
      end
    end

    context 'when the item exists' do
      it 'should render the item' do
        item = Catchoom::Item.create(name: SecureRandom.hex(8), collection: @collection.resource_uri)
        expect(Catchoom::Item.find(item.uuid).resource_uri).not_to be_nil
        item.destroy
      end
    end
  end

  describe 'update a item' do
    it 'should update the item' do
      item = Catchoom::Item.create(name: SecureRandom.hex(8), collection: @collection.resource_uri)
      new_name = SecureRandom.hex(8)
      expect(item.update(name: new_name).name).to eq new_name
      item.destroy
    end
  end

  describe 'delete a item' do
    it 'should delete the item' do
      item = Catchoom::Item.create(name: SecureRandom.hex(8), collection: @collection.resource_uri)
      uuid = item.uuid
      item.destroy
      expect(Catchoom::Item.find(uuid)).to be_nil
    end
  end
end