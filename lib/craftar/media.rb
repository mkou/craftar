module Craftar
  class Media < Craftar::Base
    attr_reader :uuid, :file, :resource_uri, :name, :mimetype

    def self.craftar_name
      'media'
    end

    def initialize(opts)
      @uuid = opts[:uuid]
      @file = opts[:file]
      @resource_uri = opts[:resource_uri]
      @name = opts[:name]
      @mimetype = opts[:mimetype]
    end

    def save
      response = call(:post, file: prepare_file_from_url(@file))
      @uuid = response['uuid']
      @file = response['file']
      @resource_uri = response['resource_uri']
      @name = response['name']
      @mimetype = response['mimetype']
      self
    end
  end
end