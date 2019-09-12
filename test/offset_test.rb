require './test/test_helper'
require 'date'
require './lib/offset'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new(120919)
    #maybe use mock to set todays date
  end

  def test_it_exists
    assert_equal Offset, @offset
  end

  def test_it_initialize_with_date_and_offset
    expected_date = #todays mock date
    expected_offset = #todays mock offset
    assert_equal expected_date, @offset.date
    assert_equal expected_offset, @offset.offset
  end

  def test_it_can_create_offset
    expected = #mockvalue
    assert_equal expected, @offset.create_offset()
  end


end
