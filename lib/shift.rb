require_relative 'calculable'
require_relative 'key'
require_relative 'offset'
require 'pry'

class Shift #< Enigma
  include Calculable
  attr_reader :key, :date, :input_message, :output_message#, :characters

  def initialize(message, key = nil, date = nil, decrypt = false)
    if key != nil && key.count("0123456789") == 5 || key == nil && date == nil
      @key = Key.new(key)
      @date = Offset.new(date)
    elsif key != nil && (key.count("0123456789") == 6) && (date == nil)
      @key = Key.new
      @date = Offset.new(key)
    end
    @decrypt = decrypt
    @characters = Array("a".."z").push(" ")
    @input_message = message.downcase.chars
    @output_message = nil
  end

  def shift_message
    @output_message = @input_message.map.each_with_index do |char, index|
      if encrypt_character_set_a(char, index)
        encrypt_character_set_a(char, index)
      elsif encrypt_character_set_b(char, index)
        encrypt_character_set_b(char, index)
      elsif encrypt_character_set_c(char, index)
        encrypt_character_set_c(char, index)
      elsif encrypt_character_set_d(char, index)
        encrypt_character_set_d(char, index)
      end
    end
  @output_message = @output_message.join
  end

end
