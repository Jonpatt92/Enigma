require_relative 'calculable'

class Offset #< Shift is this necessary?
  include Calculable
  attr_reader :date

  def initialize(date = nil)
    @date = date
    if date == nil
      @date = create_date
    end
  end
end

# Make calculable method, callable in shift
# Can I access @date from this method if it's stored in calculable?

# def calculate_offset(date)
#   offset_value = @date.to_i * @date.to_i
#   @offset_value = offset_value.to_s[-4..-1]
# end
