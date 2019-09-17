require './lib/enigma'
require './lib/shift'
require './lib/key'
require './lib/offset'
require 'pry'

enigma = Enigma.new
enigma.encrypt("h!el!!lo !!wo!!rld!", "02715", "040895")
binding.pry
