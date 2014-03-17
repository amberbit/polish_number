$:.push File.expand_path("../lib", __FILE__)
require "polish_number/version"

Gem::Specification.new do |s|
  s.name = "polish_number"
  s.version = "0.1.0"
  s.date = "2010-10-04"
  s.summary = "Translates numbers to Polish words"
  s.description = s.summary = <<-END
    Translates numbers to Polish words
  END
  s.authors = ["Wojciech Piekutowski"]
  s.email = "wojciech@piekutowski.net"
  s.files = ['lib/polish_number.rb']
  s.homepage = "http://github.com/amberbit/polish_number"
  s.license = "Ruby 1.8"

  s.add_development_dependency 'rake', '~> 0'
  s.add_development_dependency 'test-unit', '~> 0'
  s.add_development_dependency 'test-spec', '~> 0'
end
