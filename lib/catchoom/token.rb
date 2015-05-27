module Catchoom
  class Token < Catchoom::Base
    attr_reader :token, :resource_uri, :collection
    def self.catchoom_name
      'collection'
    end

    def initialize(opts)
      @collection = opts[:collection]
      @token = opts[:token]
      @resource_uri = opts[:resource_uri]
    end

    def save
      response = call(:post, collection: @collection)
      @token = response['token']
      @resource_uri = response['resource_uri']
      self
    end

    def update(opts)
      response = call(:put, { uuid: @uuid, collection: opts[:collection] })
      @collection = response['collection']
      self
    end
  end
end
