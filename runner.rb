require './lib/enigma'
require './lib/shift'
require './lib/key'
require './lib/offset'
require 'pry'

enigma = Enigma.new
enigma.encrypt("hello")
binding.pry
