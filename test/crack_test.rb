require './test/test_helper'
require './lib/crack'

class CrackTest < Minitest::Test

  def setup
    @crack = Crack.new("Hello world end")
    @crack_1 = Crack.new("Hello world end", "130592")
  end

  def test_it_exists
    assert_instance_of Crack, @crack
  end

  def test_it_has_attributes
    assert_equal "Hello world end", @crack_1.input_message
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

end