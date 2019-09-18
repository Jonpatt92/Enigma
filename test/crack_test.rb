require './test/test_helper'
require './lib/crack'
require './lib/enigma'

class CrackTest < Minitest::Test

  def setup
    @crack = Crack.new("Hello world end")
    @crack_1 = Crack.new("Hello world end", "130592")
    @crack_2 = Crack.new("vjqtbeaweqihssi", "291018")
  end

  def test_it_exists
    assert_instance_of Crack, @crack
  end

  def test_it_has_attributes
    expected_input = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d", " ", "e", "n", "d"]
    assert_equal expected_input, @crack_1.input_message
    assert_equal "130592", @crack_1.date.date
  end

  def test_it_can_initialize_with_no_key
    assert_equal "130592", @crack_1.date.date
    assert_equal 5, @crack_1.key.key_value.count("0123456789")
  end

  def test_it_can_initialize_with_no_date_or_key
    expected_date = Date.today.strftime("%d%m%y")

    assert_equal expected_date, @crack.date.date
    assert_equal 5, @crack.key.key_value.count("0123456789")
  end

  def test_it_can_crack
    @crack_2.cracking

    assert_equal "hello world end", @crack_2.output_message
  end

end
