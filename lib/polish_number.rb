# frozen_string_literal: false
require "polish_number/version"
require "polish_number/process"

module PolishNumber
  def self.in_words(number)
    PolishNumber::Process.in_words(number)
  end
end
