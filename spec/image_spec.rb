describe Catchoom::Image do
  before(:all) do
    Catchoom.api_key = api_key
    @collection = Catchoom::Collection.create(name: SecureRandom.hex(8))
    @item = Catchoom::Item.create(name: SecureRandom.hex(8), collection: @collection.resource_uri)
    @image_url = 'http://catchoom.com/wp-content/files/2014/10/augmented-reality-creator-img.png'
  end

  after(:all) do
    @collection.destroy
  end

  describe 'create an image' do
    it 'should create an online image' do
      image = Catchoom::Image.create(item: @item.resource_uri, file: @image_url)
      expect(image.uuid).not_to be_nil
      image.destroy
    end
    context 'when the item does not exist' do
      it 'should raise an error' do
        name = SecureRandom.hex(8)
        expect { Catchoom::Image.create(item: 'abcd', file: @image_url) }.to raise_error
      end
    end
    context 'when the image is too small' do
      it 'should raise an error' do
        expect { Catchoom::Image.create(item: @item.resource_uri, file: 'http://catchoom.com/wp-content/themes/catchoom/images/logo.png') }.to raise_error
      end
    end
  end

  describe 'find an image' do
    context 'when the image does not exist' do
      it 'should be nil' do
        expect(Catchoom::Image.find('abcd')).to be_nil
      end
    end

    context 'when the image exists' do
      it 'should render the image' do
        image = Catchoom::Image.create(item: @item.resource_uri, file: @image_url)
        expect(Catchoom::Image.find(image.uuid).resource_uri).not_to be_nil
        image.destroy
      end
    end
  end

  describe 'delete an image' do
    it 'should delete the image' do
      image = Catchoom::Image.create(item: @item.resource_uri, file: @image_url)
      uuid = image.uuid
      image.destroy
      expect(Catchoom::Image.find(uuid)).to be_nil
    end
  end
end