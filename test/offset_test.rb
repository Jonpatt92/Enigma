require './test/test_helper'
require './lib/offset'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new
    @offset_2 = Offset.new("130592")
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_it_initialize_with_todays_date_if_no_arg
    expected_date = Date.today.strftime("%d%m%y")
    assert_equal expected_date, @offset.date
  end

  def test_it_accepts_date_argument
    assert_equal "130592", @offset_2.date
  end

end
