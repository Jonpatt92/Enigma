require './test/test_helper'
require 'date'
require './lib/key'

class KeyTest < Minitest::Test

  def setup
    @key_1 = Key.new
    @key_2 = Key.new("01234")
    @key_3 = Key.new("1234")
  end

  def test_it_exists
    assert_instance_of Key, @key_1
  end

  def test_it_can_initialize_and_shift_with_key_argument
    expected_shift = {  a: "01",
                        b: "12",
                        c: "23",
                        d: "34"
                      }

    assert_equal "01234", @key_2.key
    assert_equal expected_shift, @key_2.key_shift
  end

  def test_it_can_initialize_and_shift_without_key_argument

    assert_equal 5, @key_1.key.count("0123456789")
    assert_equal true, @key_1.key_shift.fetch_values(:a, :b, :c, :d).all? {|obj| obj.count("0123456789") == 2}
  end

end
