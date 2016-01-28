module Craftar
  class Item < Craftar::Base
    attr_reader :uuid, :name, :collection, :url, :content, :custom, :trackable, :resource_uri, :tags
    def self.craftar_name
      'item'
    end

    def initialize(opts)
      @name = opts[:name]
      @collection = opts[:collection]
      @url = opts[:url]
      @content = opts[:content]
      @custom = opts[:custom]
      @trackable = opts[:trackable]
      @uuid = opts[:uuid]
      @tags = opts[:tags]
      @resource_uri = opts[:resource_uri]
    end

    def save
      response = json_call(
        :post,
        {
         name: @name,
         collection: @collection,
         trackable: @trackable,
         content: @content,
         custom: @custom,
         tags: @tags
        }.select { |_, value| !value.nil? }
      )
      @uuid = response['uuid']
      @resource_uri = response['resource_uri']
      self
    end

    def update(opts)
      options = {
        name: opts[:name],
        collection: opts[:collection],
        url: opts[:url],
        content: opts[:content],
        custom: opts[:custom],
        tags: @tags,
        trackable: opts[:trackable]
      }.select { |_, value| !value.nil? }
      response = json_call(:put, { uuid: @uuid }.merge(options))
      @name = response['name']
      @collection = response['collection']
      @tags = response['tags']
      @url = response['url']
      @content = response['content']
      @custom = response['custom']
      @trackable = response['trackable']
      self
    end
  end
end
