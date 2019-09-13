require './test/test_helper'
require './lib/offset'
require 'date'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new
    @offset_2 = Offset.new("130592")
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_it_initialize_with_todays_date_and_offset
    expected_date = Date.today.strftime("%d%m%y")
    assert_equal expected_date, @offset.date
    assert_equal expected_offset, @offset.offset
  end

  def test_it_accepts_date_argument
    assert_equal "130592", @offset_2.date
    assert_equal "0464", @offset_2.offset
  end

  def test_it_can_calculate_offset
    assert_equal "4561", @offset.calculate_offset
  end

end
