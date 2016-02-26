module Craftar
  class Collection < Craftar::Base
    attr_reader :uuid, :name, :resource_uri, :offline
    def self.craftar_name
      'collection'
    end

    def initialize(opts)
      @name = opts[:name]
      @uuid = opts[:uuid]
      @resource_uri = opts[:resource_uri]
      @offline = opts[:offline]
    end

    def save
      response = json_call(:post, name: @name, offline: @offline)
      @uuid = response['uuid']
      @resource_uri = response['resource_uri']
      self
    end

    def update(opts)
      response = json_call(:put, { uuid: @uuid, name: opts[:name], offline: opts[:offline]}.select { |_, value| !value.nil? })
      @name = response['name']
      self
    end
  end
end
