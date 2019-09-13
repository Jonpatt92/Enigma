require './test/test_helper'
require './lib/shift'

class ShiftTest < Minitest::Test

  def setup
    @shift = Shift.new()

  end

  def test_it_exists
    assert_instance_of Shift, @shift_1
  end

end
