# encoding: utf-8

require 'polish_number/version'

module PolishNumber
  HUNDREDS = ['', 'sto ', 'dwieście ', 'trzysta ', 'czterysta ', 'pięćset ', 'sześćset ',
    'siedemset ', 'osiemset ', 'dziewięćset '].freeze

  TENS = ['', 'dziesięć ', 'dwadzieścia ', 'trzydzieści ', 'czterdzieści ', 'pięćdziesiąt ',
    'sześćdziesiąt ', 'siedemdziesiąt ', 'osiemdziesiąt ', 'dziewięćdziesiąt '].freeze

  TEENS = ['', 'jedenaście ', 'dwanaście ', 'trzynaście ', 'czternaście ', 'piętnaście ',
    'szesnaście ', 'siedemnaście ', 'osiemnaście ', 'dziewiętnaście '].freeze

  UNITIES = ['', 'jeden ', 'dwa ', 'trzy ', 'cztery ', 'pięć ', 'sześć ', 'siedem ', 'osiem ',
    'dziewięć '].freeze

  ZERO = 'zero'.freeze

  THOUSANDS = { one: 'tysiąc', few: 'tysiące', many: 'tysięcy' }.freeze

  MILLIONS = { one: 'milion', few: 'miliony', many: 'milionów' }.freeze

  CURRENCIES = {
    PLN: { one: 'złoty', few: 'złote', many: 'złotych' },
    PLN_CENTS: { one: 'grosz', few: 'grosze', many: 'groszy' }
  }.freeze

  def self.translate(number, options = {})
    if options[:currency] && !CURRENCIES.key?(options[:currency])
      raise ArgumentError, "unknown :currency option '#{options[:currency].inspect}'. Choose one from: #{CURRENCIES.inspect}"
    end

    number, fractional = number.to_s.split('.')
    number = number.to_i
    fractional = fractional.to_s

    raise ArgumentError, 'number should be in 0..999999999 range' unless (0..999_999_999).include?(number)
    raise ArgumentError, 'fractional part should be in 0..99 range' unless fractional =~ /^\d{0,2}$/

    fractional = "#{fractional}0"[0, 2].to_i

    if number.zero?
      result = ZERO.dup
    else
      formatted_number = format('%<number>09.0f', number: number)
      digits = formatted_number.chars.map(&:to_i)

      result = ''
      result << process_0_999(digits[0..2])
      result << millions(number / 1_000_000, digits[0..2])
      result << ' '
      result << process_0_999(digits[3..5])
      result << thousands(number / 1_000, digits[3..5])
      result << ' '
      result << process_0_999(digits[6..9])
      result.strip!
    end

    if options[:currency]
      currency = CURRENCIES[options[:currency]]
      result << ' '
      result << currency[classify(number, digits)]

      if fractional.positive?
        result << ' i '
        fractional_digits = format('%<number>03.0f', number: fractional).chars.map(&:to_i)
        result << process_0_999(fractional_digits)
        fractional_currency = CURRENCIES["#{options[:currency]}_CENTS".to_sym]
        result << fractional_currency[classify(fractional, fractional_digits)]
      end
    end

    result
  end

  class << self
    private

    def process_0_999(digits)
      result = ''
      result << HUNDREDS[digits[0]]

      if digits[1] == 1 && digits[2] != 0
        result << TEENS[digits[2]]
      else
        result << TENS[digits[1]]
        result << UNITIES[digits[2]]
      end

      result
    end

    def thousands(number, digits)
      return '' if number.zero?

      THOUSANDS[classify(number, digits)]
    end

    def millions(number, digits)
      return '' if number.zero?

      MILLIONS[classify(number, digits)]
    end

    def classify(number, digits)
      if number == 1
        :one
      # all numbers with 2, 3 or 4 at the end, but not teens
      elsif digits && (2..4).include?(digits[-1]) && digits[-2] != 1
        :few
      else
        :many
      end
    end
  end
end
