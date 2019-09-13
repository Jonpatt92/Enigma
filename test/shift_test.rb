require './test/test_helper'
require './lib/shift'

class ShiftTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    key = @enigma.key.find_key_shift
    offset = @enigma.offset.offset_value
    @shift_1 = Shift.new(key, offset_value)
  end

  def test_it_exists
    assert_instance_of Shift, @shift_1
  end
