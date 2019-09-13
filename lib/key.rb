require 'pry'
#require_relative 'enigma'

class Key #< Enigma...or...Shift
  attr_reader :key_value
  def initialize(key = nil)

   @key_value = key.to_s

    if key == nil
     @key_value = self.random_key
    end

    #Make this value be set & stored in Shift ...or... accessible to Shift. Changeable to Enigma
    #@key_shift = self.find_key_shift
  end

  #Make calculable(or randomable) method, callable in Shift and Key
  def random_key
    5.times.map { rand(0..9) }.join #5 digit number as a string
  end

  #Make calculable method, callable in Shift
  def find_key_shift(key)
    key_shift = {a: 0, b: 0, c: 0, d: 0}
    if key.count("0123456789") == 5
      string_key = key.to_s
    elsif
     key = self.random_key
      string_key = key.to_s
    end

    key_shift[:a] = string_key[0..1]
    key_shift[:b] = string_key[1..2]
    key_shift[:c] = string_key[2..3]
    key_shift[:d] = string_key[3..4]

    key_shift
  end

end

binding.pry

# elsif key != nil && key.to_s.count("0123456789") != 5
#  @key_value = self.random_key
#   puts "The key must be a 5 digit number, generating random key."
