require 'pry'
require 'date'
class Offset
  attr_reader :date, :offset

  def initialize(date = nil)
    @date = date
    if date == nil
      @date = self.create_date
    end

    @offset = self.calculate_offset
  end

  def create_date
    Date.today.strftime("%d%m%y")
  end

  def calculate_offset
    offset_value = @date.to_i * @date.to_i
    offset_value.to_s[-4..-1]
  end
end

# binding.pry
