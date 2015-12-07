# encoding: UTF-8

require File.join(File.expand_path(File.dirname(__FILE__)), "spec_helper")

describe :PolishNumber do
  {
    0 => { :number => 'zero', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    1 => { :number => 'jeden', :PLN => 'złoty', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    2 => { :number => 'dwa', :PLN => 'złote', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    4 => { :number => 'cztery', :PLN => 'złote', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    5 => { :number => 'pięć', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    9 => { :number => 'dziewięć', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    10 => { :number => 'dziesięć', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    11 => { :number => 'jedenaście', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    12 => { :number => 'dwanaście', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    14 => { :number => 'czternaście', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    15 => { :number => 'piętnaście', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    19 => { :number => 'dziewiętnaście', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    20 => { :number => 'dwadzieścia', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    21 => { :number => 'dwadzieścia jeden', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    22 => { :number => 'dwadzieścia dwa', :PLN => 'złote', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    24 => { :number => 'dwadzieścia cztery', :PLN => 'złote', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    25 => { :number => 'dwadzieścia pięć', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    29 => { :number => 'dwadzieścia dziewięć', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    30 => { :number => 'trzydzieści', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    31 => { :number => 'trzydzieści jeden', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    32 => { :number => 'trzydzieści dwa', :PLN => 'złote', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    32.21 => { :number => 'trzydzieści dwa', :PLN => 'złote', :cents_digital => '21/100', :cents_word => 'dwadzieścia jeden', :NO_100 => 'setnych', :PLN_100 => 'groszy' },
    34 => { :number => 'trzydzieści cztery', :PLN => 'złote', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    35 => { :number => 'trzydzieści pięć', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    45 => { :number => 'czterdzieści pięć', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    99 => { :number => 'dziewięćdziesiąt dziewięć', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    100 => { :number => 'sto', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    100.99 => { :number => 'sto', :PLN => 'złotych', :cents_digital => '99/100', :cents_word => 'dziewięćdziesiąt dziewięć', :NO_100 => 'setnych', :PLN_100 => 'groszy' },
    101 => { :number => 'sto jeden', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    200 => { :number => 'dwieście', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    212 => { :number => 'dwieście dwanaście', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    323 => { :number => 'trzysta dwadzieścia trzy', :PLN => 'złote', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    440 => { :number => 'czterysta czterdzieści', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    999 => { :number => 'dziewięćset dziewięćdziesiąt dziewięć', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    1000 => { :number => 'tysiąc', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    1002 => { :number => 'tysiąc dwa', :PLN => 'złote', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    1011 => { :number => 'tysiąc jedenaście', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    1111 => { :number => 'tysiąc sto jedenaście', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    1222 => { :number => 'tysiąc dwieście dwadzieścia dwa', :PLN => 'złote', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    2415 => { :number => 'dwa tysiące czterysta piętnaście', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    5000 => { :number => 'pięć tysięcy', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    10000 => { :number => 'dziesięć tysięcy', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    22141 => { :number => 'dwadzieścia dwa tysiące sto czterdzieści jeden', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    123754 => { :number => 'sto dwadzieścia trzy tysiące siedemset pięćdziesiąt cztery', :PLN => 'złote', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    999999 => { :number => 'dziewięćset dziewięćdziesiąt dziewięć tysięcy dziewięćset dziewięćdziesiąt dziewięć', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    1999999 => { :number => 'milion dziewięćset dziewięćdziesiąt dziewięć tysięcy dziewięćset dziewięćdziesiąt dziewięć', :PLN => 'złotych', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' },
    5123754 => { :number => 'pięć milionów sto dwadzieścia trzy tysiące siedemset pięćdziesiąt cztery', :PLN => 'złote', :cents_digital => '00/100', :cents_word => 'zero', :PLN_100 => 'groszy' }
    }.each do |number, translation|
    it "should translate #{number} to '#{translation[:number]}'" do
      if number == number.to_i
        result = translation[:number]
      else
        result = "#{translation[:number]} i #{translation[:cents_word]} #{translation[:NO_100]}"
      end
      PolishNumber.translate(number).should == result
    end

    it "should translate #{number} to '#{translation[:number]} #{translation[:PLN]}' with currency :PLN" do
      #for auto hundredth part is omited
      if number == number.to_i
        result = "#{translation[:number]} #{translation[:PLN]}"
      else
        result = "#{translation[:number]} #{translation[:PLN]}, #{translation[:cents_word]} #{translation[:PLN_100]}"
      end
      PolishNumber.translate(number, :currency => :PLN).should == result
    end

    it "should translate #{number} to '#{translation[:number]} #{translation[:PLN]} #{translation[:cents_digital]}' with currency :PLN and :cents => :digits" do
      PolishNumber.translate(number, :currency => :PLN, :cents => :digits).should == "#{translation[:number]} #{translation[:PLN]} #{translation[:cents_digital]}"
    end
    it "should translate #{number} to '#{translation[:number]} #{translation[:PLN]}' with currency :PLN and :cents => :no" do
      PolishNumber.translate(number, :currency => :PLN, :cents => :no).should ==
          "#{translation[:number]} #{translation[:PLN]}"
    end

    it "should translate #{number} to '#{translation[:number]} #{translation[:PLN]}' with currency :PLN and :cents => :words" do
      PolishNumber.translate(number, :currency => :PLN, :cents => :words).should ==
          "#{translation[:number]} #{translation[:PLN]}, #{translation[:cents_word]} #{translation[:PLN_100]}"
    end

  end
  it "should translate 0.50 to pięćdziesiąt setnych" do
    PolishNumber.translate(0.50).should ==
        "pięćdziesiąt setnych"
  end

  it "should translate 0.50 to pięćdziesiąt setnych with currency :PLN and :cents => :words" do
    PolishNumber.translate(0.50, :currency => :PLN, :cents => :words).should ==
        "zero złotych, pięćdziesiąt groszy"
  end

  it "should translate 0.50 to pięćdziesiąt setnych with currency :PLN and :cents => :digits" do
    PolishNumber.translate(0.50, :currency => :PLN, :cents => :digits).should ==
        "zero złotych 50/100"
  end

  it "should translate 1 :with currrency :EUR to jedno euro" do
    PolishNumber.translate(1, :currency => :EUR).should ==
        "jedno euro"
  end

  it "should translate 21 :with currrency :EUR to dwadzieścia jeden euro" do
    PolishNumber.translate(21, :currency => :EUR).should ==
        "dwadzieścia jeden euro"
  end

  it "should translate 0.01 :with currrency :SEK to jedno öre" do
    PolishNumber.translate(0.01, :currency => :SEK).should ==
        "jedno öre"
  end

  it "should translate 2 :with currrency :SEK to dwie korony" do
    PolishNumber.translate(2, :currency => :SEK).should ==
        "dwie korony"
  end

  it "should translate 21 :with currrency :SEK to dwadzieścia jeden koron" do
    PolishNumber.translate(21, :currency => :SEK).should ==
        "dwadzieścia jeden koron"
  end

  it "should translate 52 :with currrency :SEK to pięćdziesiąt dwie korony" do
    PolishNumber.translate(52, :currency => :SEK).should ==
        "pięćdziesiąt dwie korony"
  end

  it "should translate 1_000_002 :with currrency :SEK to milion dwie korony" do
    PolishNumber.translate(1_000_002, :currency => :SEK).should ==
        "milion dwie korony"
  end
  it "should translate 1_000_001 to milion jeden" do
    PolishNumber.translate(1_000_001).should ==
        "milion jeden"
  end

  it "should raise ArgumentError when number is smaller than 0" do
    lambda { PolishNumber.translate(-1) }.should.raise(ArgumentError)
  end

  it "should raise ArgumentError when number is greater than 999999999.99" do
    lambda { PolishNumber.translate(1_000_000_000) }.should.raise(ArgumentError)
  end

  it "should raise ArgumentError when currency is unknown" do
    lambda { PolishNumber.translate(1_000_000, :currency => :ABC) }.
      should.raise(ArgumentError)
  end

  it "should accept new currencies" do
    PolishNumber.add_currency(:COWS, { :one => 'krowa', :few => 'krowy', :many => 'krów', :gender => :she,
      :one_100 => 'ser', :few_100 => 'sery', :many_100 => 'serów', :gender_100 => :hi})
    PolishNumber.translate(35.05, :currency => :COWS).should ==
      "trzydzieści pięć krów, pięć serów"
  end

end
