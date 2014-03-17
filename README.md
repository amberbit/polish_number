polish_number [![Code Climate](https://codeclimate.com/github/amberbit/polish_number.png)](https://codeclimate.com/github/amberbit/polish_number)
=============

Translates numbers to Polish words

Installation
------------

Tested with Ruby 1.8.7 and 1.9.2.

```sh
gem install polish_number
```

Usage
-----

```Ruby
require 'polish_number'

PolishNumber.translate(1234) #=> tysiąc dwieście trzydzieści cztery
PolishNumber.translate(34, :currency => :PLN) #=> trzydzieści cztery złote
PolishNumber.translate(12, :currency => :PLN) #=> dwanaście złotych
```

Running specs
-------------

```Shell
rake test
```

TODO
----
* currently works for numbers 0-999999. Make it work with millions, billions, etc
* optional noun pluralization
* add an executable

GitHub
------

http://github.com/amberbit/polish_number

Credits
-------

polish_number is maintained by [Wojciech Piekutowski](http://piekutowski.net) with support from [AmberBit](http://www.amberbit.com).
