require 'polish_number/process_number'
require 'polish_number/process_thousands'
require 'polish_number/classify_numbers'

module PolishNumber
  class ProcessIntegerPart
    CURRENCIES = {one: 'złoty', few: 'złote', many: 'złotych'}.freeze

    def initialize(number)
      @number = number
    end

    def self.call(number)
      new(number).call
    end

    def call
      return 'zero złotych' if @number == '0'
      [over_or_equal_thousand, less_than_thousand].join(' ')
    end

    private

    def over_or_equal_thousand
      scope = digits[0..2]
      [PolishNumber::ProcessNumber.call(scope),
       PolishNumber::ProcessThousands.call(@number, scope)].join
    end

    def less_than_thousand
      [
        PolishNumber::ProcessNumber.call(digits[3..5]),
        CURRENCIES[PolishNumber::ClassifyNumbers.call(@number, digits)],
      ].join
    end

    def digits
      @digits ||= @number.rjust(6, '0').chars.map(&:to_i)
    end
  end # class ProcessIntegerPart
end # module PolishNumber
