require './test/test_helper'
require './lib/calculable'
require './lib/shift'

class CalculableTest < Minitest::Test

  def setup
    @date = Date.today.strftime("%d%m%y")
    @shift = Shift.new("Hello world")
    @shift_2 = Shift.new("Hello world", "02715", "040895")
    @shift_3 = Shift.new("Hello world", "2715", "040895")
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
    key_shift = {:a=>"12", :b=>"23", :c=>"34", :d=>"45"}
    date_shift = "0464"
    expected = [12, 27, 40, 49]
    assert_equal expected, @shift.calculate_shift(key_shift, date_shift)
  end

  def test_calculate_shift_for_decrypt
    key_shift = {:a=>"12", :b=>"23", :c=>"34", :d=>"45"}
    date_shift = "0464"
    expected = [-12, -27, -40, -49]
    assert_equal expected, @shift.calculate_shift(key_shift, date_shift, true)
  end

  def test_find_shift
    expected = [3, 27, 73, 20]

    assert_equal expected, @shift_2.find_shift
    assert_equal 4, @shift_3.find_shift.count
  end

  def test_character_set_a
    expected = ["d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c"]
    assert_equal expected, @shift_2.character_set_a
  end

  def test_character_set_b
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @shift_2.character_set_b
  end

  def test_character_set_c
    expected = ["t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s"]
    assert_equal expected, @shift_2.character_set_c
  end

  def test_character_set_d
    expected = ["u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t"]
    assert_equal expected, @shift_2.character_set_d
  end

  def test_encrypt_character_set_a
    assert_equal "k", @shift_2.encrypt_character_set_a("h", 0)
  end

  def test_encrypt_character_set_b
    assert_equal "e", @shift_2.encrypt_character_set_b("e", 1)
  end

  def test_encrypt_character_set_c
    assert_equal "d", @shift_2.encrypt_character_set_c("l", 2)
  end

  def test_encrypt_character_set_d
    assert_equal "e", @shift_2.encrypt_character_set_d("l", 3)
  end

end
