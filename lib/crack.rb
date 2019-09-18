require_relative 'crackable'
require_relative 'key'
require_relative 'offset'
require 'pry'

class Crack
  include Crackable
  attr_reader :key, :date, :input_message, :output_message

  def initialize(message, date = nil)
    @date = Offset.new(date)
    @offset = calculate_offset(@date.date)
    @key = Key.new
    @characters = Array("a".."z").push(" ")
    @input_message = message.downcase.chars
    @output_message = []
    @absolute_shift = nil
  end

  def cracking
    possible_keys = Array("00001".."99999")
    until @output_message[-4..-1] == " end"
      @key = Key.new(possible_keys.shift)
      @absolute_shift = find_shift
      shift_message
    end
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
