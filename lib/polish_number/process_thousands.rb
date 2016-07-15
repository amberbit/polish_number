require 'polish_number/classify_numbers'

module PolishNumber
  class ProcessThousands
    THOUSANDS = {one: 'tysiąc', few: 'tysiące', many: 'tysięcy'}.freeze

    def initialize(number, digits)
      @number = number
      @digits = digits
    end

    def self.call(number, digits)
      new(number, digits).call
    end

    def call
      value = @number.to_i / 1000
      return '' unless value > 0
      THOUSANDS[PolishNumber::ClassifyNumbers.call(value, @digits)]
    end
  end # ProcessThousands
end # module PolishNumber
