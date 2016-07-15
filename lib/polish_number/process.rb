require 'bigdecimal'
require 'bigdecimal/util'
require 'polish_number/process_integer_part'
require 'polish_number/process_decimal_part'

module PolishNumber
  class Process
    def initialize(number)
      unless (0..999_999).cover? BigDecimal.new(number)
        fail 'Invalid range - (0 - 999_999)'
      end
      @number = number.to_s
    end

    def self.in_words(number)
      new(number).in_words
    end

    def in_words
      [
        PolishNumber::ProcessIntegerPart.call(integer_part),
        PolishNumber::ProcessDecimalPart.call(decimal_part),
      ].join(' ').strip
    end

    private

    def integer_part
      @integer_part ||= @number.to_i.to_s
    end

    def decimal_part
      ((BigDecimal.new(@number) - integer_part.to_i) * 100).round(2).to_i.to_s
    end
  end # class Process
end # module PolishNumber
