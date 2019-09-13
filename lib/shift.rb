#strike code
#require_relative 'key'
require_relative 'enigma'

class Shift < Enigma
  attr_accessor :key, :date, :characters

  def initialize(key = nil, date = nil, decrypt = false) # (key)

    @key = Key.new(key)
    @date = Offset.new(date)
    @key_shift = find_key_shift(@key.key_value)
    @date_shift = calculate_offset(@date.date)
    @absolute_shift = calculate_shift(decrypt)
  # @output_text = #might be local value assigned in Enigma.encrypt, then stored in Enigma instance variable @encrypted_message. Visa versa for Enigma.decrypt, output stored as @decrypted_message
  # @characters  #consider making a variable accessible in Enigma, or instantiated in Enigma as a class variable


    # @key_shift = key_shift
    # @key_shift = Key.new.key_shift if key_shift == nil
    #
    # @date_shift = date_shift
    # @date_shift = Offset.new.offset_value if date_shift == nil
    #
    # @shift = self.calculate_shift
    # @characters = a..z + " "
  end

  #Make calculable method, callable in Shift, returns {a:,b:,c:,d:} hash
  def calculate_shift
    #@shift = combine @date_shift & @key_shift
  end
end
