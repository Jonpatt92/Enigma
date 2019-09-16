require './test/test_helper'
require './lib/shift'


class ShiftTest < Minitest::Test

  def setup
    @shift = Shift.new
    @shift_2 = Shift.new("Hello world", "12345", "130592")
    @shift_3 = Shift.new("encrypted hello world", "12345", "130592", true)

  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_it_can_initialize_with_no_arguments
    expected_date = Date.today.strftime("%d%m%y")

    assert_equal expected_date, @shift.date.date
    assert_equal 5, @shift.key.key_value.count("0123456789")
    assert_nil @shift.output_message
  end

  def test_it_can_initialize_with_arguments
    assert_equal "130592", @shift_3.date.date
    assert_equal "12345", @shift_3.key.key_value
    assert_nil @shift_3.output_message
  end


  def test_shift_message_encrypt
    skip
    @shift_2.shift_message

    assert_equal "encrypted hello world", @shift_2.output_message
  end

  def test_shift_message_decrypt
    skip
    @shift_3.shift_message

    assert_equal "hello world", @shift_3.output_message
  end

end
