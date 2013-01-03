require File.expand_path('../lib/armory_api/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'armory_api'
  s.version = ArmoryApi::Version
  s.summary = 'Ruby wrapper for the World of Warcraft API'
  s.description = 'Ruby wrapper for the official World of Warcraft REST APIs'
  s.authors = ['Francesco Ceccon']
  s.files = ['lib/armory_api.rb']
  s.platform = Gem::Platform::RUBY

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 2.11.0'
  s.add_development_dependency 'faraday'
end
