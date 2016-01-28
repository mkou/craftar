module Craftar
  class Tag < Craftar::Base
    attr_reader :uuid, :name, :collection, :resource_uri
    def self.craftar_name
      'tag'
    end

    def initialize(opts)
      @name = opts[:name]
      @collection = opts[:collection]
      @uuid = opts[:uuid]
      @resource_uri = opts[:resource_uri]
    end

    def save
      response = json_call(
        :post,
        {
         name: @name,
         collection: @collection,
        }
      )
      @uuid = response['uuid']
      @resource_uri = response['resource_uri']
      self
    end

    def update(opts)
      options = {
        name: opts[:name],
        collection: opts[:collection],
      }.select { |_, value| !value.nil? }
      response = json_call(:put, { uuid: @uuid }.merge(options))
      @name = response['name']
      @collection = response['collection']
      @uuid = response['uuid']
      @resource_uri = response['resource_uri']
      self
    end
  end
end
