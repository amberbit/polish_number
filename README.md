# Polish Number

Translates numbers to Polish words.

## Installation

Add this line to your application's Gemfile:

    gem 'polish_number'

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

1. Fork it ( http://github.com/amberbit/polish_number/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
