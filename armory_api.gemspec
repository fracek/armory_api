Gem::Specification.new do |s|
  s.name = 'armory_api'
  s.version = '0.1.0'
  s.summary = 'Ruby wrapper for the World of Warcraft API'
  s.description = 'Ruby wrapper for the official World of Warcraft REST APIs'
  s.authors = ['Francesco Ceccon']
  s.files = ['lib/armory_api.rb']
  s.platform = Gem::Platform::RUBY

  s.add_development_dependency 'rspec', '~> 2.11.0'
end
