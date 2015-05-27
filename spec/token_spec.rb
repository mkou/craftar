describe Catchoom::Token do
  before do
    Catchoom.api_key = api_key
  end

  describe 'create a token' do
    it 'should create an online token' do
      token = Catchoom::Token.create({})
      expect(token.token).not_to be_nil
      token.destroy
    end
    context 'when we want to create a token attached to an unexisting collection' do
      it 'should raise an error' do
        expect { Catchoom::Token.create(collection: 'abcd') }.to raise_error
      end
    end
    context 'when we want to create a token attached to an existing collection' do
      it 'should raise an error' do
        collection = Catchoom::Collection.create(name: SecureRandom.hex(8))
        token = Catchoom::Token.create(collection: collection.resource_uri)
        expect(token.token).not_to be_nil
        token.destroy
      end
    end
  end

  describe 'delete a token' do
    it 'should delete the token' do
      token = Catchoom::Token.create(name: SecureRandom.hex(8))
      token.destroy
      expect(Catchoom::Token.list[:objects]).to be_blank
    end
  end
end