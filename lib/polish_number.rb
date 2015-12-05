# encoding: utf-8

require "polish_number/version"

module PolishNumber
  HUNDREDS = ['', 'sto ', 'dwieście ', 'trzysta ', 'czterysta ', 'pięćset ', 'sześćset ',
    'siedemset ', 'osiemset ', 'dziewięćset ']

  TENS = ['', 'dziesięć ', 'dwadzieścia ', 'trzydzieści ', 'czterdzieści ', 'pięćdziesiąt ',
    'sześćdziesiąt ', 'siedemdziesiąt ', 'osiemdziesiąt ', 'dziewięćdziesiąt ']

  TEENS = ['', 'jedenaście ', 'dwanaście ', 'trzynaście ', 'czternaście ', 'piętnaście ',
    'szesnaście ', 'siedemnaście ', 'osiemnaście ', 'dziewiętnaście ']

  UNITIES = ['', 'jeden ', 'dwa ', 'trzy ', 'cztery ', 'pięć ', 'sześć ', 'siedem ', 'osiem ',
    'dziewięć ']

  ZERO = 'zero'

  THOUSANDS = {:one => 'tysiąc', :few => 'tysiące', :many => 'tysięcy'}

  MILLIONS = {:one => 'milion', :few => 'miliony', :many => 'milionów'}

  CENTS = [:auto, :no, :words, :digits]

  CURRENCIES = {
    :NO => {:one => '', :few => '', :many => '',
            :one_100 => 'setna', :few_100 => 'setne', :many_100 => 'setnych', :gender_100 => :she},
    :PLN => {:one => 'złoty', :few => 'złote', :many => 'złotych',
            :one_100 => 'grosz', :few_100 => 'grosze', :many_100 => 'groszy'},
    :USD => { :one => 'dolar', :few => 'dolary', :many => 'dolarów',
            :one_100 => 'cent', :few_100 => 'centy', :many_100 => 'centów'},
    :EUR => { :one => 'euro', :few => 'euro', :many => 'euro', :gender => :it,
            :one_100 => 'cent', :few_100 => 'centy', :many_100 => 'centów'},
    :GBP => { :one => 'funt', :few => 'funty', :many => 'funtów',
            :one_100 => 'pens', :few_100 => 'pensy', :many_100 => 'pensów'},
    :CHF => { :one => 'frank', :few => 'franki', :many => 'franków',
            :one_100 => 'centym', :few_100 => 'centymy', :many_100 => 'centymów'},
    :SEK => { :one => 'korona', :few => 'korony', :many => 'koron', :gender => :she,
            :one_100 => 'öre', :few_100 => 'öre', :many_100 => 'öre', :gender_100 => :it}
  }

  def self.validate(number, options)
    if options[:currency] && !CURRENCIES.has_key?(options[:currency])
      raise ArgumentError, "Unknown :currency option '#{options[:currency].inspect}'." +
                  " Choose one from: #{CURRENCIES.inspect}"
    end

    if options[:cents] && !CENTS.include?(options[:cents])
      raise ArgumentError, "Unknown :cents option '#{options[:cents].inspect}'." +
                  " Choose one from: #{CENTS.inspect}"
    end

    unless (0..999999999).include? number
      raise ArgumentError, 'number should be in 0..999999999 range'
    end
    options
  end

  def self.translate(number, options={})

    options = validate(number, options)

    options[:cents] ||= :auto
    number = number.to_i if options[:cents]==:no
    formatted_number = sprintf('%012.2f', number)
    currency = CURRENCIES[options[:currency] || :NO]

    digits = formatted_number.chars.map { |char| char.to_i }
    result = process_1_999999999(digits[0..8], options, number, currency)

    process_99_0(result, digits, options, formatted_number[-2..-1], currency)

  end

  def self.add_currency(name, hash)
    CURRENCIES[name]=hash
  end

  private

  def self.process_99_0(result, digits, options, formatted_sub_number, currency)
    if options[:cents] == :words ||
        (options[:cents] == :auto && formatted_sub_number != '00')
      digits_cents = digits[-3..-1] if digits
      number_cents = formatted_sub_number.to_i
      result << ' i ' unless result.empty?
      result << process_0_999(digits_cents, number_cents, currency[:gender_100] || :hi) if digits
      result << ZERO.dup if formatted_sub_number == '00'
      result.strip!
      result << ' '
      result << currency[classify(formatted_sub_number.to_i, digits_cents, true)]
    elsif options[:cents] == :digits
      result << ' '
      result << formatted_sub_number
      result << '/100'
    end

    result
  end

  def self.process_1_999999999(digits, options, number, currency)
    if number == 0
      result = ZERO.dup
    else
      result = ''
      result << process_0_999(digits[0..2], number, :number)
      result << millions(number.to_i/1000000, digits[0..2])
      result.strip!
      result << ' '
      result << process_0_999(digits[3..5], number, :number)
      result << thousands(number.to_i/1000, digits[3..5])
      result.strip!
      result << ' '
      result << process_0_999(digits[6..8], number, currency[:gender] || :hi)
      result.strip!
    end

    if options[:currency] && !result.empty?
      result << ' ' + currency[classify(number.to_i, digits)]
    end
    result
  end

  def self.process_0_999(digits, number, object)
    result = ''
    result << HUNDREDS[digits[0]]

    if digits[1] == 1 && digits[2] != 0
      result << TEENS[digits[2]]
    else
      result << TENS[digits[1]]
      result << process_0_9(digits, number, object)
    end

    result
  end

  def self.process_0_9(digits, number, object)
    if digits[2] == 2 && object == :she
      'dwie '
    elsif number == 1 && object == :she
      'jedna '
    elsif number == 1 && object == :it
      'jedno '
    elsif digits == [0,0,1] && object == :number
      ''
    else
      UNITIES[digits[2]]
    end
  end

  def self.thousands(number, digits)
    if number == 0 || digits == [0, 0, 0]
      ''
    else
      THOUSANDS[classify(number, digits)]
    end
  end

  def self.millions(number, digits)
    if number == 0 || digits == [0, 0, 0]
      ''
    else
      MILLIONS[classify(number, digits)]
    end
  end

  def self.classify(number, digits, cents=false)
    if number == 1
      return :one_100 if cents
      :one
    # all numbers with 2, 3 or 4 at the end, but not teens
    elsif digits && (2..4).include?(digits[-1]) && digits[-2] != 1
      return :few_100 if cents
      :few
    else
      return :many_100 if cents
      :many
    end
  end
end
