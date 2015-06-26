# coding: utf-8
lib = File.expand_path('../services', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |s|
  s.name          = 'procurecarros-client-ruby-sdk'
  s.version       = Procurecarros::Rspec::VERSION
  s.date          = '2015-05-01'
  s.summary       = "Procurecarros Client SDK Integration Services"
  s.description   = "%q{Procurecarros Client SDK Gem}"
  s.authors       = ["Iuri Andreazza"]
  s.email         = 'iuri@procurecarros.com'

  s.files         = `git ls-files`.split($/)
  s.executables   = []
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['.','api']

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'bundler', '~> 1.3'
  s.add_development_dependency 'rake'

  s.homepage    = 'http://rubygems.org/gems/procurecarros-sdk'
  s.license     = 'MIT'
end
