module Craftar
  class Token < Craftar::Base
    attr_reader :token, :resource_uri, :collection
    def self.craftar_name
      'token'
    end

    def initialize(opts)
      @collection = opts[:collection]
      @token = opts[:token]
      @resource_uri = opts[:resource_uri]
    end

    def save
      response = json_call(:post, collection: @collection)
      @token = response['token']
      @resource_uri = response['resource_uri']
      self
    end

    def find(token)
      raise 'You cannot find a token'
    end

    def destroy
      self.class.delete("/token/#{@token}/", self.class.basic_options)
    end
  end
end
