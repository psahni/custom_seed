# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'custom_seed/version'

Gem::Specification.new do |spec|
  spec.name          = "custom_seed"
  spec.version       = CustomSeed::VERSION
  spec.authors       = ["Prashant Sahni"]
  spec.email         = ["prashant.sahni5@gmail.com"]
  spec.platform    = Gem::Platform::RUBY
  spec.homepage = "http://prashantsahni.in"
  spec.description   = "A gem for managing and maintaining seed versions, just like rails migrations"
  spec.summary = "Maintain your seed versions easily"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", "> 3.0.0"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.6"
  spec.add_development_dependency "database_cleaner", "0.6.7"
  spec.add_development_dependency "sqlite3-ruby", "~> 1.3.0"
  spec.add_development_dependency "generator_spec", "~> 0.8.2"
  spec.require_path = 'lib'

end
