require File.expand_path('../lib/catchoom/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name        = 'catchoom'
  spec.version     = Catchoom::VERSION
  spec.date        = '2015-05-25'
  spec.description = %q{ Ruby client that supports all of the Catchoom API methods. Intuitive query methods allow you easily call API endpoints. }
  spec.summary     = %q{ Ruby client for the official Catchoom Management API }
  spec.authors     = ["Marieke Gueye"]
  spec.email       = 'marieke.gueye@gmail.com'
  spec.files       = [
    "lib/catchoom.rb",
    "lib/catchoom/base.rb",
    "lib/catchoom/collection.rb",
    "lib/catchoom/image.rb",
    "lib/catchoom/item.rb",
    "lib/catchoom/media.rb",
    "lib/catchoom/token.rb"
  ]
  spec.homepage    = 'https://github.com/mkou/catchoom'
  spec.license     = 'MIT'
  spec.add_development_dependency "rspec",  '~> 3.2', '>= 3.2.0'
  spec.add_dependency "httmultiparty", '~> 0.3', '>= 0.3.16'
end