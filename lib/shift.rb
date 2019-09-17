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

#Can't get to work.
# def shift_message
#   new_char = nil
#   binding.pry
#   @output_message = @input_message.map.each_with_index do |char, index| #Replaces the input_message's character with whatever set matches its required shift ('a' through 'd')
#     until new_char.class == String
#       new_char = encrypt_character_set_a(char, index) #if encrypt_character_set_a(char, index) # Replaces the input_message's character with the 'a' shifted version.
#       new_char = encrypt_character_set_b(char, index) #if encrypt_character_set_b(char, index) # Replaces the input_message's character with the 'b' shifted version.
#       new_char = encrypt_character_set_c(char, index) #if encrypt_character_set_c(char, index) # Replaces the input_message's character with the 'c' shifted version.
#       new_char = encrypt_character_set_d(char, index) #if encrypt_character_set_d(char, index) # Replaces the input_message's character with the 'd' shifted version.
#     end
#     new_char
#   end
#   binding.pry
#   @output_message = @output_message.join
# end
