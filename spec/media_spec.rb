describe Craftar::Media do
  before(:all) do
    Craftar.api_key = api_key
    @file_url = 'http://craftar.com/wp-content/files/2014/10/augmented-reality-creator-img.png'
  end

  describe 'create a media' do
    it 'should create an online media' do
      media = Craftar::Media.create(file: @file_url)
      expect(media.uuid).not_to be_nil
      media.destroy
    end
     end

  describe 'find a media' do
    context 'when the media does not exist' do
      it 'should be nil' do
        expect(Craftar::Media.find('abcd')).to be_nil
      end
    end

    context 'when the media exists' do
      it 'should render the media' do
        media = Craftar::Media.create(file: @file_url)
        expect(Craftar::Media.find(media.uuid).resource_uri).not_to be_nil
        media.destroy
      end
    end
  end

  describe 'delete a media' do
    pending 'The Craftar API is not working for this function'

    # It is not working in their api for now
    #it 'should delete the media' do
    #  media = Craftar::Media.create(file: @file_url)
    #  uuid = media.uuid
    #  media.destroy
    #  expect(Craftar::Media.find(uuid)).to be_nil
  end
end