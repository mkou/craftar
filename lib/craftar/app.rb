module Craftar
  class App < Craftar::Base
    attr_reader :uuid, :name, :resource_uri, :collection
    def self.craftar_name
      'app'
    end

    def initialize(opts)
      @name = opts[:name]
      @uuid = opts[:uuid]
      @collection = opts[:collection]
      @resource_uri = opts[:resource_uri]
    end

    def save
      response = json_call(:post, name: @name, collection: @collection)
      @uuid = response['uuid']
      @resource_uri = response['resource_uri']
      self
    end

    def update(opts)
      raise 'You cannot update an application id'
    end
  end
end
