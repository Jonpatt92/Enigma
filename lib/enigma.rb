require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
require_relative 'shift'


class Enigma
  attr_accessor :encrypted_message, :decrypted_message
  attr_reader :shift

  def initialize
    @shift = nil
    @deshift = nil
    @encrypt_key = nil
    @encrypt_date = nil
    @encrypted_message = nil
    @decrypted_message = nil
  end

  def encrypt(message, key = nil, date = nil)

    @shift = Shift.new(message, key, date)
    @encrypt_key = @shift.key.key_value
    @encrypt_date = @shift.date.date
    @shift.shift_message
    @encrypted_message = @shift.output_message
    encrypted_hash = { encryption: @encrypted_message,
                       key: @encrypt_key,
                       date: @encrypt_date }
    encrypted_hash
  end

  def decrypt(message = @encrypted_message, key = @encrypt_key, date = @encrypt_date)
    #find a way to ensure date is received as the date in absense of key argument
    @deshift = Shift.new(message, key, date, true)
    @deshift.shift_message
    @decrypted_message = @deshift.output_message
    decrypted_hash = { decryption: decrypted_message,
                       key: key,
                       date: date }
    decrypted_hash
  end
end

# binding.pry
#instantiate characters here or in Shift, must be accessible to shift
#Shift.new # Shift object could store @key & @offset. This could instantiate here as nil, then be created when you call Enigma.encrypt.

#...For extra security, you could instantiate a new shift object with Enigma.encrypt. Then pass the Shift.key & Shift.date values to corresponding instance variables in Enigma.  Plus have shift automatically set a class variable = to the encrypted message.
# Then Enigma.decrypt would use those values to generate a Deshift class object, which sets a 2nd class variable = to the decrypted message, which is then referenced in decrypt's output.
