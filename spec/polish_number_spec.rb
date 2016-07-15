# encoding: UTF-8
require File.join(File.expand_path(File.dirname(__FILE__)), "spec_helper")

describe :PolishNumber do
  {
    0 => 'zero złotych',
    1 => 'jeden złoty',
    2 => 'dwa złote',
    4 => 'cztery złote',
    5 => 'pięć złotych',
    9 => 'dziewięć złotych',
    10 => 'dziesięć złotych',
    11 => 'jedenaście złotych',
    12 => 'dwanaście złotych',
    14 => 'czternaście złotych',
    15 => 'piętnaście złotych',
    19 => 'dziewiętnaście złotych',
    20 => 'dwadzieścia złotych',
    21 => 'dwadzieścia jeden złotych',
    22 => 'dwadzieścia dwa złote',
    24 => 'dwadzieścia cztery złote',
    25 => 'dwadzieścia pięć złotych',
    29 => 'dwadzieścia dziewięć złotych',
    30 => 'trzydzieści złotych',
    31 => 'trzydzieści jeden złotych',
    34 => 'trzydzieści cztery złote',
    35 => 'trzydzieści pięć złotych',
    45 => 'czterdzieści pięć złotych',
    32 => 'trzydzieści dwa złote',
    99 => 'dziewięćdziesiąt dziewięć złotych',
    100 => 'sto złotych',
    101 => 'sto jeden złotych',
    200 => 'dwieście złotych',
    212 => 'dwieście dwanaście złotych',
    323 => 'trzysta dwadzieścia trzy złote',
    440 => 'czterysta czterdzieści złotych',
    999 => 'dziewięćset dziewięćdziesiąt dziewięć złotych',
    1000 => 'jeden tysiąc złotych',
    1002 => 'jeden tysiąc dwa złote',
    1011 => 'jeden tysiąc jedenaście złotych',
    1111 => 'jeden tysiąc sto jedenaście złotych',
    1222 => 'jeden tysiąc dwieście dwadzieścia dwa złote',
    2415 => 'dwa tysiące czterysta piętnaście złotych',
    5000 => 'pięć tysięcy złotych',
    10000 => 'dziesięć tysięcy złotych',
    22141 => 'dwadzieścia dwa tysiące sto czterdzieści jeden złotych',
    123754 => 'sto dwadzieścia trzy tysiące siedemset pięćdziesiąt cztery' \
              ' złote',
    999999 => 'dziewięćset dziewięćdziesiąt dziewięć tysięcy dziewięćset' \
              ' dziewięćdziesiąt dziewięć złotych',
    '100.23' => 'sto złotych dwadzieścia trzy grosze',
    '1234.324' => 'jeden tysiąc dwieście trzydzieści cztery złote trzydzieści' \
                  ' dwa grosze',
  }.each do |number, translation|
    it "should translate #{number} to '#{translation}'" do
      PolishNumber.in_words(number).should == translation
    end
  end

  it "should raise ArgumentError when number is smaller than 0" do
    lambda { PolishNumber.in_words(-1) }.should.raise(RuntimeError)
  end

  it "should raise ArgumentError when number is greater than 999999999.99" do
    lambda { PolishNumber.in_words(1_000_000_000) }.should.raise(RuntimeError)
  end
end
