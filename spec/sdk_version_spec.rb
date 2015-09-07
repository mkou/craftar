describe Craftar::App do
  before do
    Craftar.api_key = api_key
  end

  describe 'find an app' do
    context 'when the app does not exist' do
      it 'should be nil' do
        expect(Craftar::SdkVersion.find('abcd')).to be_nil
      end
    end
  end
end