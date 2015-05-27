require File.expand_path('../lib/catchoom/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name        = 'catchoom'
  spec.version     = Catchoom::VERSION
  spec.date        = '2015-05-25'
  spec.summary     = "Catchoom's Managment API gem"
  spec.description = "Catchoom's Managment API gem"
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
  spec.homepage    = 'http://rubygems.org/gems/catchoom'
  spec.license     = 'MIT'
  spec.add_development_dependency "rspec"
  spec.add_dependency "httmultiparty"
end