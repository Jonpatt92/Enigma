#strike code

class Shift
  attr_accessor :shift, :key_shift, :date_shift, :characters

  def initialize(key_shift = nil, date_shift = nil)
    @key_shift = key_shift
    @key_shift = Key.new.key_shift if key_shift = nil

    @date_shift = date_shift
    @date_shift = Offset.new.offset_value if date_shift = nil

    @shift = self.calculate_shift
    @characters = a..z + " "
  end

  def calculate_shift
    #@shift = combine @date_shift & @key_shift
  end
end
