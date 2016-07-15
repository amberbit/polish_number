require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

def silently(&block)
  warn_level = $VERBOSE
  $VERBOSE = nil
  result = block.call
  $VERBOSE = warn_level
  result
end

require 'polish_number'
require 'polish_number/classify_numbers'
require 'polish_number/process'
require 'polish_number/process_decimal_part'
require 'polish_number/process_integer_part'
require 'polish_number/process_number'
require 'polish_number/process_thousands'

silently do
  require 'rubygems'
  gem 'test-unit'
  require 'test/spec'
end

require 'pp'
