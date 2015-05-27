describe Catchoom::Media do
  before(:all) do
    Catchoom.api_key = api_key
    @file_url = 'http://catchoom.com/wp-content/files/2014/10/augmented-reality-creator-img.png'
  end

  describe 'create a media' do
    it 'should create an online media' do
      media = Catchoom::Media.create(file: @file_url)
      expect(media.uuid).not_to be_nil
      media.destroy
    end
     end

  describe 'find a media' do
    context 'when the media does not exist' do
      it 'should be nil' do
        expect(Catchoom::Media.find('abcd')).to be_nil
      end
    end

    context 'when the media exists' do
      it 'should render the media' do
        media = Catchoom::Media.create(file: @file_url)
        expect(Catchoom::Media.find(media.uuid).resource_uri).not_to be_nil
        media.destroy
      end
    end
  end

  describe 'delete a media' do
    pending 'The Catchoom API is not working for this function'

    # It is not working in their api for now
    #it 'should delete the media' do
    #  media = Catchoom::Media.create(file: @file_url)
    #  uuid = media.uuid
    #  media.destroy
    #  expect(Catchoom::Media.find(uuid)).to be_nil
  end
end