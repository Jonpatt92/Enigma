

class Key
  attr_reader :key, :key_shift
  def initialize(key = nil)
    @key = key.to_s

    if key == nil
      @key = self.random_key
    elsif (key != nil) && (key.to_s.count("0123456789") != 5)
      @key = self.random_key
      puts "The key must be a 5 digit number, generating random key."
    end

    @key_shift = self.find_key_shift
  end

  def random_key
    5.times.map { rand(1..9) }.join # 5 digit number as a string
  end

  def find_key_shift
    key_shift = {a: 0, b: 0, c: 0, d: 0}
    if @key.count("0123456789") == 5
      string_key = @key.to_s
    elsif
      @key = self.random_key
      string_key = @key.to_s
    end

    key_shift[:a] = string_key[0..1]
    key_shift[:b] = string_key[1..2]
    key_shift[:c] = string_key[2..3]
    key_shift[:d] = string_key[3..4]
  end

end
