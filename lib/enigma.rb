require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
require_relative 'shift'
require_relative 'cracking'

class Enigma
  attr_accessor :decrypted_message

  def initialize
    @crack = nil
    @shift = nil
    @deshift = nil
    @encrypt_key = nil
    @encrypt_date = Date.today.strftime("%d%m%y")
    @encrypted_message = nil
    @decrypted_message = nil
    @cracked_message = nil
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

  def crack(message = @encrypted_message, date = Date.today.strftime("%d%m%y"))
    @crack = Cracking.new(message, date)
    @crack.cracking
    @cracked_message = @crack.output_message
    cracked_hash = {  decryption: @cracked_message,
                      key: @crack.key.key_value,
                      date: date }
    cracked_hash
  end
end
