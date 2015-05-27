describe Catchoom::Collection do
  before do
    Catchoom.api_key = api_key
  end

  describe 'create a collection' do
    it 'should create an online collection' do
      collection = Catchoom::Collection.create(name: SecureRandom.hex(8))
      expect(collection.uuid).not_to be_nil
      collection.destroy
    end
    context 'when the name is already used' do
      it 'should raise an error' do
        name = SecureRandom.hex(8)
        collection = Catchoom::Collection.create(name: name)
        expect { Catchoom::Collection.create(name: name) }.to raise_error
        collection.destroy
      end
    end
  end

  describe 'find a collection' do
    context 'when the collection does not exist' do
      it 'should be nil' do
        expect(Catchoom::Collection.find('abcd')).to be_nil
      end
    end

    context 'when the collection exists' do
      it 'should render the collection' do
        collection = Catchoom::Collection.create(name: SecureRandom.hex(8))
        expect(Catchoom::Collection.find(collection.uuid).resource_uri).not_to be_nil
        collection.destroy
      end
    end
  end

  describe 'update a collection' do
    it 'should update the collection' do
      collection = Catchoom::Collection.create(name: SecureRandom.hex(8))
      new_name = SecureRandom.hex(8)
      expect(collection.update(name: new_name).name).to eq new_name
      collection.destroy
    end
  end

  describe 'delete a collection' do
    it 'should delete the collection' do
      collection = Catchoom::Collection.create(name: SecureRandom.hex(8))
      uuid = collection.uuid
      collection.destroy
      expect(Catchoom::Collection.find(uuid)).to be_nil
    end
  end
end