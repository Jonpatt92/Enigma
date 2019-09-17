require 'pry'

module Calculable

  # Callable in Shift and Offset
  def create_date
    Date.today.strftime("%d%m%y")
  end

  # Callable in Shift and Key
  def random_key
    rand.to_s[2..6] #5 digit number as a string
  end

  # Callable in shift
  def calculate_offset(date)
    offset_value = date.to_i * date.to_i
    offset_value.to_s[-4..-1]
  end

  # Callable in Shift
  def find_key_shift(key)
    key_shift = {a: 0, b: 0, c: 0, d: 0}
    this_key = key.to_s
    if this_key.count("0123456789") == 5
      string_key = this_key
    else
      rand_key = self.random_key
      string_key = rand_key
    end

    key_shift[:a] = string_key[0..1]
    key_shift[:b] = string_key[1..2]
    key_shift[:c] = string_key[2..3]
    key_shift[:d] = string_key[3..4]

    key_shift
  end

  #Callable in Shift, returns {a:,b:,c:,d:} hash
  def calculate_shift(key_shift, date_shift, decrypt = false)
    this_key_shift = key_shift
    this_date_shift = date_shift
    this_key_shift.transform_values!(&:to_i)

    this_key_shift[:a] += this_date_shift[0].to_i
    this_key_shift[:b] += this_date_shift[1].to_i
    this_key_shift[:c] += this_date_shift[2].to_i
    this_key_shift[:d] += this_date_shift[3].to_i

    if decrypt
      neg_shift = Hash.new(0)
      this_key_shift.each do |k, v|
        neg_shift[k] = -1 * v
      end
      neg_shift.each_value.to_a
    else
      this_key_shift.each_value.to_a
    end
  end

  def find_shift
    key_shift = find_key_shift(@key.key_value) # Hash
    date_shift = calculate_offset(@date.date) # 4 digit integer
    calculate_shift(key_shift, date_shift, @decrypt)
  end

  def character_set_a
    @characters.rotate(find_shift[0])
  end

  def character_set_b
    @characters.rotate(find_shift[1])
  end

  def character_set_c
    @characters.rotate(find_shift[2])
  end

  def character_set_d
    @characters.rotate(find_shift[3])
  end

  def encrypt_character_set_a(msg_character, msg_char_index)
    if (msg_char_index + 4) % 4 == 0
      msg_character_base_index = @characters.index(msg_character)
      character_set_a[msg_character_base_index]
    end
  end

  def encrypt_character_set_b(msg_character, msg_char_index)
    if (msg_char_index + 3) % 4 == 0
      msg_character_base_index = @characters.index(msg_character)
      character_set_b[msg_character_base_index]
    end
  end

end

 ###All of these would only work if methods can be more than 7 lines inside classes, resulting methods are massive###
  #Called in shift. Outputs encrypted or decrypted message based on 'absolute_shift'
  # def apply_shift(message, shift)
  #   shifted_char = create_character_shift(shift[:a])
  #   msg_char_index = find_character_index(message)
  #   message = message.downcase.chars
  #
  #   encrypted_msg = []
  #   msg_char_index.each do |char, index|
  #   encrypted_msg = message.map do |msg_char|
  #       if msg_char == char
  #         shifted_char[index]
  #       end
  #     end
  #   end
  #    binding.pry
  #   encrypted_msg
  # end
  #
  # def find_character_index(message)
  #   input_message = message.downcase.chars
  #   characters = Array("a".."z").push(" ")
  #   index_hash = Hash.new
  #   input_message.each {|message_char| index_hash[message_char] = characters.index(message_char)}
  #   index_hash
  # end
  #
  # def create_character_shift(shift_key)
  #   characters = Array("a".."z").push(" ")
  #   characters = characters.rotate(shift_key)
  #   # characters_hash = characters.to_h {|e| [e, characters.index(e)]}
  #   # characters_hash
  #   characters
  # end
