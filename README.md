# Polish Number [![Build Status](https://travis-ci.org/amberbit/polish_number.png?branch=master)](https://travis-ci.org/amberbit/polish_number)

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

## Contributing

1. [Fork it](http://github.com/amberbit/polish_number/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[![Analytics](https://ga-beacon.appspot.com/UA-49257773-1/README.md?pixel)](https://github.com/igrigorik/ga-beacon)
