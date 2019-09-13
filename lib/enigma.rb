require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
#require 'date' #shouldn't be necessary with bundler
require_relative 'offset'
require_relative 'key'
require_relative 'shift'

#Superclass, methods here defines Class Variables:

#@@key
#Only Enigma can assign anything other than a nil-balancing random key

#@@date
#Only Enigma can assign anything other than a nil-balancing 'today's date'
class Enigma #< Shift? see line 22
  attr_reader :key, :offset, :shift

  def initialize
    @shift = nil #Shift.new # Shift object could store @key & @offset. This could instantiate here as nil, then be created when you call Enigma.encrypt.

    #...For extra security, you could instantiate a new shift object with Enigma.encrypt. Then pass the Shift.key & Shift.date values to corresponding instance variables in Enigma.  Plus have shift automatically set a class variable = to the encrypted message.
    # Then Enigma.decrypt would use those values to generate a Deshift class object, which sets a 2nd class variable = to the decrypted message, which is then referenced in decrypt's output.
  # @encrypt_key = nil
  # @encrypt_date = nil
 #  @characters = a...z + " " #instantiate here or in Shift, must be accessible to shift

    #@key = Key.new #random key ... Maybe don't store this here, as a form of security
    #@offset = Offset.new #the date offset ... Maybe don't store this here, as a form of security
  end

  def encrypt(message, key = nil, date = nil)
    shift = Shift.new(key, date)
    @encrypt_key = shift.key
    @encrypt_date = shift.date
  end

  def decrypt(encrypted_message, key = @encrypt_key, date = @encrypt_date)
    deshift = Shift.new(@encrypt_key, @encrypt_date, true)
  end
end
