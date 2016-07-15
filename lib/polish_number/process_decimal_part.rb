require 'polish_number/process_number'
require 'polish_number/classify_numbers'

module PolishNumber
  class ProcessDecimalPart
    CURRENCIES = {one: 'grosz', few: 'grosze', many: 'groszy'}.freeze

    def initialize(number)
      @number = number.to_i
    end

    def self.call(number)
      new(number).call
    end

    def call
      return '' if @number == 0
      [
        PolishNumber::ProcessNumber.call(digits),
        CURRENCIES[PolishNumber::ClassifyNumbers.call(@number, digits)],
      ].join
    end

    private

    def digits
      @digits ||= @number.to_s.rjust(3, '0').chars.map(&:to_i)
    end
  end # class ProcessDecimalPart
end # module PolishNumber
