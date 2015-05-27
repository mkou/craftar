require 'bundler/setup'
Bundler.setup

require 'httmultiparty'
require 'catchoom'
require 'pry'

RSpec.configure do |config|
  config.order = :random
end

def api_key
  'your_api_key'
end