require 'bundler/setup'
Bundler.setup

require 'httmultiparty'
require 'catchoom'

RSpec.configure do |config|
  config.order = :random
end

# TODO: enter your Catchoom api key here in order to run your tests
def api_key
  'your_api_key'
end