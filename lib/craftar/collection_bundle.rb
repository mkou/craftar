module Craftar
  class CollectionBundle < Craftar::Base
    attr_reader :uuid, :app, :collection, :file, :resource_uri, :status, :version, :tag
    def self.craftar_name
      'collectionbundle'
    end

    def initialize(opts)
      @uuid = opts[:uuid]
      @resource_uri = opts[:resource_uri]
      @app = opts[:app]
      @collection = opts[:collection]
      @version = opts[:version]
      @file = opts[:file]
      @status = opts[:status]
      @tag = opts[:tag]
    end

    def save
      response = json_call(:post, app: @app, collection: @collection, version: @version, tag: @tag)
      update_attributes(response)
      self
    end

    def update(opts)
      attributes = {
        app: opts[:app],
        collection: opts[:collection],
        version: opts[:version],
        tag: opts[:tag]
      }.select { |_, value| !value.nil? }

      response = json_call(:put, attributes)
      update_attributes(response)
      self
    end

    def update_attributes(response)
      @uuid = response['uuid']
      @app = response['app']
      @collection = response['collection']
      @file = response['file']
      @resource_uri = response['resource_uri']
      @status = response['status']
      @version = response['version']
      @version = response['tag']
    end
  end
end
