module Craftar
  class SdkVersion < Craftar::Base
    attr_reader :resource_uri, :uuid, :sdk_version, :verbose_name

    def self.craftar_name
      'version'
    end

    def self.create
      raise 'You cannot create a sdk version'
    end

    def initialize(opts)
      @uuid = opts[:uuid]
      @resource_uri = opts[:resource_uri]
      @version = opts[:sdk_version]
      @verbose_name = opts[:verbose_name]
    end


    def save
      raise 'You cannot save a sdk version'
    end

    def destroy
      raise 'You cannot destroy a sdk version'
    end
  end
end