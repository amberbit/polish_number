module PolishNumber
  class ClassifyNumbers
    def initialize(value, digits)
      @value = value.to_i
      @digits = digits
    end

    def self.call(value, digits)
      new(value, digits).call
    end

    def call
      return :one if @value == 1
      return :few if @digits && (2..4).cover?(@digits[-1]) && @digits[-2] != 1
      :many
    end
  end # class ClassifyNumbers
end # module PolishNumber
