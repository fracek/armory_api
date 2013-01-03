unless ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_filter 'spec'
  end
end

require 'armory_api'
require 'rspec'
require 'webmock/rspec'

RSpec.configure do |configure|
  configure.expect_with :rspec do |conf|
    conf.syntax = :expect
  end
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(filename)
  File.new(fixture_path + '/' + filename)
end
