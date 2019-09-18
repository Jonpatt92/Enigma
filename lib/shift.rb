require_relative 'calculable'
require_relative 'key'
require_relative 'offset'

class Shift
  include Calculable
  attr_reader :key, :date, :input_message, :output_message

  def initialize(message, key = nil, date = nil, decrypt = false)
    if key != nil && key.count("0123456789") != 6 || key == nil && date == nil # Put this in a method and call that method here. #Lookup parallel assignment
      @key = Key.new(key) #@key, @date = key_date_generator(key, date)
      @date = Offset.new(date)
    elsif key != nil && (key.count("0123456789") == 6) && (date == nil)
      @key = Key.new
      @date = Offset.new(key)
    end
    @decrypt = decrypt
    @characters = Array("a".."z").push(" ")
    @input_message = message.downcase.chars
    @output_message = []
  end

  def shift_message
    @output_message = @input_message.map.each_with_index do |char, index|
      if encrypt_character_set_a(char, index) # If this returns truthy, the input_message's character falls inside the 'a' set.
        encrypt_character_set_a(char, index) # Replaces the input_message's character with the shifted version.
      elsif encrypt_character_set_b(char, index) # If this returns truthy, the input_message's character falls inside the 'b' set.
        encrypt_character_set_b(char, index) # Replaces the input_message's character with the shifted version.
      elsif encrypt_character_set_c(char, index) # If this returns truthy, the input_message's character falls inside the 'c' set.
        encrypt_character_set_c(char, index) # Replaces the input_message's character with the shifted version.
      elsif encrypt_character_set_d(char, index) # If this returns truthy, the input_message's character falls inside the 'd' set.
        encrypt_character_set_d(char, index) # Replaces the input_message's character with the shifted version.
      end
    end
    @output_message = @output_message.join
  end

end
