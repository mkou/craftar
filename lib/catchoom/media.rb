module Catchoom
  class Media < Catchoom::Base
    attr_reader :uuid, :file, :resource_uri

    def self.catchoom_name
      'media'
    end

    def initialize(opts)
      @uuid = opts[:uuid]
      @file = opts[:file]
      @resource_uri = opts[:resource_uri]

    end

    def save
      response = call(:post, file: prepare_file_from_url(@file))
      @uuid = response['uuid']
      @file = response['file']
      @resource_uri = response['resource_uri']
      self
    end
  end
end