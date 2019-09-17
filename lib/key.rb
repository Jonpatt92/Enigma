require_relative 'calculable'

class Key #< Shift is this necessary?
  include Calculable
  attr_reader :key_value

  def initialize(key = nil)
   @key_value = key.to_s

    if key == nil || key.count("0123456789") != 5
     @key_value = random_key
    end
  end
end
