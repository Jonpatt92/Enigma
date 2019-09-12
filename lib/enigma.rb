require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
#require 'date' #shouldn't be necessary with bundler

class Enigma
  attr_reader :key, :offset, :shift

  def initialize
    @key = key#random key
    @offset = offset#the date offset
    @shift = shift#the amount of shift 1-4
  end

  def encrypt

  end

  def decrypt

  end
binding.pry
end
