require './test/test_helper'
require './lib/shift'

class ShiftTest < Minitest::Test

  def setup
    @shift = Shift.new("Hello world", "02715")
    @shift_1 = Shift.new("Hello world", "040895")
    @shift_2 = Shift.new("Hello world", "02715", "040895")
    @shift_3 = Shift.new("keder ohulw", "02715", "040895", true)
    @shift_4 = Shift.new("Hello world!", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_it_can_initialize_with_no_date
    expected_date = Date.today.strftime("%d%m%y")

    assert_equal expected_date, @shift.date.date
    assert_equal 5, @shift.key.key_value.count("0123456789")
  end

  def test_it_can_initialize_with_no_key
    assert_equal "040895", @shift_1.date.date
    assert_equal 5, @shift.key.key_value.count("0123456789")
  end

  def test_it_can_initialize_with_arguments
    assert_equal "040895", @shift_2.date.date
    assert_equal "02715", @shift_2.key.key_value
    assert_equal ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"], @shift_2.input_message
  end

  def test_shift_message_encrypt
    @shift_2.shift_message
    @shift_4.shift_message

    assert_equal "keder ohulw", @shift_2.output_message
    assert_equal "keder ohulw!", @shift_4.output_message
  end

  def test_shift_message_decrypt
    @shift_3.shift_message

    assert_equal "hello world", @shift_3.output_message
  end

end
