module Catchoom
  class Image < Catchoom::Base
    attr_reader :uuid, :item, :resource_uri, :file, :name, :status, :thumb_120, :thumb_60, :tracking_data_status

    def self.catchoom_name
      'image'
    end

    def initialize(opts)
      set_attributes(opts)
    end

    def save
      response = call(:post, file: prepare_file_from_url(@file_url), item: item)
      set_attributes(response)
      self
    end

    def update(opts)
      options = {
        item: opts[:item],
        file: opts[:file]
      }.select { |_, value| !value.nil? }
      response = call(:put, options)
      set_attributes(response)
      self
    end

    private

    def set_attributes(opts)
      @uuid = opts['uuid'] || opts[:uuid]
      @item = opts['item'] || opts[:item]
      @file = opts['file'] || opts[:file]
      @resource_uri = opts['resource_uri'] || opts[:resource_uri]
      @name = opts['name'] || opts[:name]
      @status = opts['status'] || opts[:status]
      @thumb_120 = opts['thumb_120'] || opts[:thumb_120]
      @thumb_60 = opts['thumb_60'] || opts[:thumb_60]
      @tracking_data_status = opts['tracking_data_status'] || opts[:tracking_data_status]
    end
  end
end