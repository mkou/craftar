module Craftar
  class Token < Craftar::Base
    attr_reader :token, :resource_uri, :collection, :tags
    def self.craftar_name
      'token'
    end

    def initialize(opts)
      @collection = opts[:collection]
      @token = opts[:token]
      @resource_uri = opts[:resource_uri]
      @tags = opts[:tags]
    end

    def save
      response = json_call(:post, collection: @collection, tags: @tags)
      @token = response['token']
      @resource_uri = response['resource_uri']
      self
    end

    def update(opts)
      options = {
        tags: opts[:tags]
      }.select { |_, value| !value.nil? }
      response = json_call(:put, { uuid: @token }.merge(options))
      @collection = response['collection']
      @tags = response['tags']
      @resource_uri = response['resource_uri']
      self
    end
    def destroy
      self.class.delete("/token/#{@token}/", self.class.basic_options)
    end
  end
end
