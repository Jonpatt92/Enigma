require './test/test_helper'
require './lib/calculable'
require './lib/shift'

class CalculableTest < Minitest::Test

  def setup
    @date = Date.today.strftime("%d%m%y")
    @shift = Shift.new
  end

  def test_create_date
    assert_equal Date.today.strftime("%d%m%y"), @shift.create_date
  end

  def test_random_key
    key = @shift.random_key
    assert_equal true, key.count("0123456789") == 5
  end

  def test_calculate_offset
    date = "130592"
    assert_equal "0464", @shift.calculate_offset(date)
  end

  def test_calculate_offset_for_today
    expected_offset = (Date.today.strftime("%d%m%y").to_i * Date.today.strftime("%d%m%y").to_i).to_s[-4..-1]

    assert_equal expected_offset, @shift.calculate_offset(@date)
  end

  def test_find_key_shift
    expected_hash = {:a=>"12", :b=>"23", :c=>"34", :d=>"45"}

    assert_equal expected_hash, @shift.find_key_shift("12345")
  end

  def test_calculate_shift_for_encrypt
    skip
    key_shift = {:a=>"12", :b=>"23", :c=>"34", :d=>"45"}
    date_shift = "0464"
    expected_hash = { a: 12,
                      b: 27,
                      c: 40,
                      d: 49  }
    assert_equal expected_hash, @shift.calculate_shift(key_shift, date_shift)
  end

  def test_calculate_shift_for_decrypt
    skip
    key_shift = {:a=>"12", :b=>"23", :c=>"34", :d=>"45"}
    date_shift = "0464"
    expected_hash = { a: -12,
                      b: -27,
                      c: -40,
                      d: -49  }
    assert_equal expected_hash, @shift.calculate_shift(key_shift, date_shift, true)
  end

  def test_apply_shift_for_encrypt
    skip
    message = "Hello world"
    shift = { a: 12,
              b: 27,
              c: 40,
              d: 49  }
    expected_string = #"encrypted hello world"
    assert_equal expected_string, @shift.apply_shift(message, shift)
  end

  def test_apply_shift_for_decrypt
    skip
    message = # encrypted "Hello world"
    shift = { a: -12,
              b: -27,
              c: -40,
              d: -49  }
    expected_string = "hello world"
    assert_equal expected_string, @shift.apply_shift(message, shift, true)
  end
end
