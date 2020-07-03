require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |test|
  test.ruby_opts  << "-w"
  test.test_files =  Dir["spec/*_spec.rb"]
  test.verbose    =  true
end

desc "Run tests"
task default: :test
