require File.expand_path('../lib/armory_api/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'armory_api'
  s.version = ArmoryApi::VERSION
  s.description = 'Wrapper for the World of Warcraft API'
  s.summary = s.description
  s.authors = ['Francesco Ceccon']
  s.email = ['francesco@ceccon.me']
  s.platform = Gem::Platform::RUBY
  s.require_path = ['lib']
  s.files = `git ls-files`.split("\n")

  s.add_dependency 'faraday', '~> 0.8'
  s.add_dependency 'faraday_middleware', '~> 0.8'

  s.add_development_dependency 'json', '~> 1.7'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'yard'
end
