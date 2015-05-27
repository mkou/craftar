require 'catchoom/base'
require 'catchoom/collection'
require 'catchoom/item'
require 'catchoom/image'
require 'catchoom/token'
require 'catchoom/media'
module Catchoom
  class << self; attr_accessor :api_key; end
end