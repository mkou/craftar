require 'craftar/base'

require 'craftar/app'
require 'craftar/collection'
require 'craftar/collection_bundle'
require 'craftar/item'
require 'craftar/image'
require 'craftar/token'
require 'craftar/sdk_version'
require 'craftar/media'
module Craftar
  class << self; attr_accessor :api_key; end
end