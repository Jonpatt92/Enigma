require_relative 'calculable'

class Offset
  include Calculable
  attr_reader :date

  def initialize(date = nil)
    @date = date
    if date == nil
      @date = create_date
    end
  end
end
