require_relative 'calculable'
require_relative 'key'
require_relative 'offset'
require 'pry'

class Shift #< Enigma
  include Calculable
  attr_reader :key, :date, :output_message#, :characters

  def initialize(message = nil, key = nil, date = nil, decrypt = false) # (key)
    @input_message = message.downcase.chars
    @key = Key.new(key)
    @date = Offset.new(date)
    @characters = Array("a".."z").push(" ")
    @decrypt = decrypt
    @output_message = nil
    shift_message

  end

  def shift_message

  end

end
