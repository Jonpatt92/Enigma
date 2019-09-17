require_relative 'calculable'
require_relative 'key'
require_relative 'offset'
require 'pry'

class Shift
  include Calculable
  attr_reader :key, :date, :input_message, :output_message

  def initialize(message, key = nil, date = nil, decrypt = false)
    if key != nil && key.count("0123456789") != 6 || key == nil && date == nil
      @key = Key.new(key)
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

## Trying to make shift_message use enumerable instead of if loop##
# def character_set_array
#   character_sets = []
#   character_sets << character_set_d << character_set_c << character_set_b << character_set_a
#   character_sets
# end

# def shift_message
#   character_sets = character_set_array
#   until @output_message.count == @input_message.count
#     @output_message = @input_message.map.each_with_index do |msg_char, msg_index|
#       character_sets.each_with_index do |char_set, set_index|
#         if (msg_index + (set_index + 1)) % 4 == 0
#           base_index = @characters.index(msg_char)
#           char_set[base_index]
#         end
#       end
#     end
#   end
#   @output_message = @output_message.join
# end
