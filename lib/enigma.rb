require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
#require 'date' #shouldn't be necessary with bundler
require_relative 'offset'
require_relative 'key'
require_relative 'shift'

class Enigma
  attr_reader :key, :offset, :shift

  def initialize
    @key = Key.new#random key
    @offset = offset#the date offset
    @shift = shift#the amount of shift 1-4
  end

  def encrypt(message, key = @key.random_key, date = @offset.date)

  end

  def decrypt

  end
binding.pry
end
