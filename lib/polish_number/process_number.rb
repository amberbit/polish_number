module PolishNumber
  class ProcessNumber
    HUNDREDS = ['', 'sto ', 'dwieście ', 'trzysta ', 'czterysta ', 'pięćset ',
                'sześćset ', 'siedemset ', 'osiemset ', 'dziewięćset '].freeze

    TENS = ['', 'dziesięć ', 'dwadzieścia ', 'trzydzieści ', 'czterdzieści ',
            'pięćdziesiąt ', 'sześćdziesiąt ', 'siedemdziesiąt ',
            'osiemdziesiąt ', 'dziewięćdziesiąt '].freeze

    TEENS = ['', 'jedenaście ', 'dwanaście ', 'trzynaście ', 'czternaście ',
             'piętnaście ', 'szesnaście ', 'siedemnaście ', 'osiemnaście ',
             'dziewiętnaście '].freeze

    UNITIES = ['', 'jeden ', 'dwa ', 'trzy ', 'cztery ', 'pięć ', 'sześć ',
               'siedem ', 'osiem ', 'dziewięć '].freeze

    def initialize(digits)
      @digits = digits
    end

    def self.call(digits)
      new(digits).call
    end

    def call
      teens? ? teens : tens
    end

    private

    def teens?
      second == 1 && third != 0
    end

    def tens
      [HUNDREDS[first], TENS[second], UNITIES[third]].join
    end

    def teens
      [HUNDREDS[first], TEENS[third]].join
    end

    def first
      @digits[0]
    end

    def second
      @digits[1]
    end

    def third
      @digits[2]
    end
  end # ProcessNumber
end # module PolishNumber
