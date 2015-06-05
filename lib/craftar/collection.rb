module Craftar
  class Collection < Craftar::Base
    attr_reader :uuid, :name, :resource_uri
    def self.craftar_name
      'collection'
    end

    def initialize(opts)
      @name = opts[:name]
      @uuid = opts[:uuid]
      @resource_uri = opts[:resource_uri]
    end

    def save
      response = json_call(:post, name: @name)
      @uuid = response['uuid']
      @resource_uri = response['resource_uri']
      self
    end

    def update(opts)
      response = json_call(:put, { uuid: @uuid, name: opts[:name] }.select { |_, value| !value.nil? })
      @name = response['name']
      self
    end
  end
end
