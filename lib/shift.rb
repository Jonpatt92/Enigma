require_relative 'calculable'
require_relative 'key'
require_relative 'offset'
require_relative 'enigma'
# require 'pry'

class Shift #< Enigma is this necessary?
  include Calculable
  attr_reader :key, :date, :output_message#, :characters

  def initialize(message = nil, key = nil, date = nil, decrypt = false) # (key)
    @input_message = message
    @key = Key.new(key)
    @date = Offset.new(date)
    @characters = Array("a".."z").push(" ")
    @decrypt = decrypt
    @output_message = nil
    # shift_message
  end

  def shift_message
    key_shift = find_key_shift(@key.key_value) # Hash
    date_shift = calculate_offset(@date.date) # 4 digit integer
    absolute_shift = calculate_shift(key_shift, date_shift, decrypt)
    @output_message = apply_shift(@input_message, @absolute_shift, @decrypt)
  end

end

# @encrypted_message = #might be local value assigned in Enigma.encrypt, then stored in Enigma instance variable @encrypted_message. Visa versa for Enigma.decrypt, output stored as @decrypted_message
# @characters  #consider making a variable accessible in Enigma, or instantiated in Enigma.
