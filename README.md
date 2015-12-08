# Polish Number [![Code Climate](https://codeclimate.com/github/amberbit/polish_number.png)](https://codeclimate.com/github/amberbit/polish_number) [![Build Status](https://travis-ci.org/amberbit/polish_number.png?branch=master)](https://travis-ci.org/amberbit/polish_number) [![Test Coverage](https://codeclimate.com/github/amberbit/polish_number/badges/coverage.svg)](https://codeclimate.com/github/amberbit/polish_number)

Translates numbers to Polish words.

## Installation

Add this line to your application's Gemfile:

    gem 'polish_number'

Note: in the past known as polish-number (dash instead of an underscore) -- before version 1.0.0. Old repo: https://github.com/wpiekutowski/polish-number

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install polish_number

## Usage

    require 'polish_number'

    PolishNumber.translate(1234) #=> tysiąc dwieście trzydzieści cztery
    PolishNumber.translate(34, :currency => :PLN) #=> trzydzieści cztery złote
    PolishNumber.translate(12, :currency => :PLN) #=> dwanaście złotych

## Cents format

    PolishNumber.translate(34.11) #=> trzydzieści cztery i jedenaście setnych
    PolishNumber.translate(30.01, :currency => :PLN) #=> trzydzieści złote i jeden grosz
    PolishNumber.translate(0.10, :currency => :PLN) #=> dziesięć groszy
    PolishNumber.translate(5.10, :currency => :PLN, :cents => :no ) #=> pięć złotych
    PolishNumber.translate(5, :currency => :PLN, :cents => :words ) #=> pięć złotych zero groszy
    PolishNumber.translate(5, :currency => :PLN, :cents => :digits ) #=> pięć złotych 00/100

## Adding new currencies

    PolishNumber.add_currency(:COWS, { :one => 'krowa', :few => 'krowy',
      :many => 'krów', :gender => :she,
      :one_100 => 'ser', :few_100 => 'sery',
      :many_100 => 'serów', :gender_100 => :hi})

    PolishNumber.translate(35.05, :currency => :COWS) #=> trzydzieści pięć krów i pięć serów



## Contributing

1. [Fork it](http://github.com/amberbit/polish_number/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[![Analytics](https://ga-beacon.appspot.com/UA-49257773-1/README.md?pixel)](https://github.com/igrigorik/ga-beacon)
