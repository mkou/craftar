# The main Catchoom class
module Catchoom
  class Base
    include HTTMultiParty
    base_uri 'https://my.craftar.net/api/v0'

    # List the objects of the described class

    # options: 'limit', 'offset'and any object specific option (see README)
    # To manage the pagination, all responses have a ‘meta’ field
    # The "meta" fields are:
    # - total_count: total number of objects in the underlying object list
    # - limit: how many objects are returned per page. By default it’s 20.
    # - offset: how many initial objects are skipped in this response
    # - previous: if available, provides a URI to the previous page
    # - next: if available, provides a URI to the next page
    # Fetching a page To navigate through pages, use the ‘limit‘ and ‘offset‘ parameters.
    # The objects of the current page are in the 'objects' fields
    def self.list(opts = {})
      response = parse_response(get("/#{catchoom_name}/", basic_options.merge(opts)))
      raise (response ['error']['message']) if response['error']
      objects = []
      response['objects'].each do |object|
        objects << self.new(object.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo})
      end
      response[:objects] =  objects
      response.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
    end

    # Find an object thanks to its uuid
    def self.find(uuid)
      response = parse_response(get("/#{catchoom_name}/#{uuid}", basic_options))
      return if response == {}
      self.new(response.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo})
    end

    # create a new object
    # options are the different specific parameters of this object.
    # See readme
    def self.create(options)
      obj = self.new(options)
      obj.save
    end

    # destroy an object
    def destroy
      self.class.delete("/#{self.class.catchoom_name}/#{uuid}/", self.class.basic_options)
    end

    private

    # the basic query option
    def self.basic_options
      { query: { api_key: Catchoom.api_key } }
    end

    def call(method_name, opts)
      response = self.class.send(method_name,
                      "/#{self.class.catchoom_name}/",
                      query: { api_key: Catchoom.api_key }.merge!(opts)
      )
      raise (response ['error']['message']) if response['error']
      response
    end

    def json_call(method_name, opts)
      uid = opts.delete(:uuid)
      path = "/#{self.class.catchoom_name}/"
      path += "#{uid}/" if uid
      path += "?api_key=#{Catchoom.api_key}"
      response = self.class.parse_response( HTTParty.send(
        method_name,
        self.class.base_uri + path,
        body: opts.to_json,
        headers: { 'Content-Type' => 'application/json' }
      ))
      raise response ['error']['message'] if response['error']
      response
    end

    def self.parse_response(httparty)
      response_body = httparty.response.body
      response_body.to_s != '' ? JSON.parse(response_body) : {}
    end

    def prepare_file_from_url(url)
      require 'open-uri'
      extname = File.extname(url)
      basename = File.basename(url, extname)

      file = Tempfile.new([basename, extname])
      file.binmode

      open(URI.parse(url)) do |data|
        file.write data.read
      end
      file.rewind
      file
    end
  end
end