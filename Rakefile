require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task test: :spec
task default: :spec

namespace :doc do
  require 'yard'
  YARD::Rake::YardocTask.new do |t|
    t.files = ['README.md', 'LICENSE.txt', 'lib/**/*.rb']
    t.options = [
      '--output-dir', 'doc/yard',
      '--markup', 'markdown'
    ]
  end
end
