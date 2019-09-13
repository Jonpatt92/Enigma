require './test/test_helper'
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

  def test_it_can_initialize_without_key_argument
    assert_equal 5, @key_1.key_value.count("0123456789")
  end

  def test_it_can_initialize_with_key_argument
    assert_equal "01234", @key_2.key_value
  end
end

# def test_it_can_initialize_with_incorrect_key_argument
#   assert_equal 5, @key_3.key_value.count("0123456789")
# end
