require 'pry'
require 'date'
#require_relative 'enigma'

class Offset #< Enigma...or...Shift
  attr_reader :date

  def initialize(date = nil)
    #Make this value be set in Enigma, otherwise set here. Accessible to Shift class
    @date = date
    if date == nil
      @date = self.create_date
    end

    #Make this value be set in Shift ...or... Make this accessible to Shift. Changeable to Enigma
    #@offset_value = self.calculate_offset
  end

  #Make calculable(or randomable) method, callable in Shift and Offset
  def create_date
    Date.today.strftime("%d%m%y")
  end

  #Make calculable method, callable in shift
  def calculate_offset(date)
    offset_value = @date.to_i * @date.to_i
    @offset_value = offset_value.to_s[-4..-1]
  end
end
