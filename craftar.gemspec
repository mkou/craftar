require File.expand_path('../lib/craftar/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name        = 'craftar'
  spec.version     = Craftar::VERSION
  spec.date        = '2015-05-25'
  spec.description = %q{ Ruby client that supports all of the Craftar CraftAR API methods. Intuitive query methods allow you easily call API endpoints. }
  spec.summary     = %q{ Ruby client for the official Craftar CraftAR Management API }
  spec.authors     = ["Marieke Gueye"]
  spec.email       = 'marieke.gueye@gmail.com'
  spec.files       = [
    "lib/craftar.rb",
    "lib/craftar/base.rb",
    "lib/craftar/collection.rb",
    "lib/craftar/image.rb",
    "lib/craftar/item.rb",
    "lib/craftar/media.rb",
    "lib/craftar/token.rb",
    "lib/craftar/collection_bundle.rb",
    "lib/craftar/app.rb",
    "lib/craftar/sdk_version.rb"
  ]
  spec.homepage    = 'https://github.com/mkou/craftar'
  spec.license     = 'MIT'
  spec.add_development_dependency "rspec",  '~> 3.2', '>= 3.2.0'
  spec.add_development_dependency "pry"

  spec.add_dependency "httmultiparty", '~> 0.3', '>= 0.3.16'
end