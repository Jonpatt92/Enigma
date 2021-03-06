module Calculable

  # Callable in Shift and Offset
  def create_date
    Date.today.strftime("%d%m%y")
  end

  # Callable in Shift and Key
  def random_key
    rand.to_s[2..6] # 5 digit number as a string
  end

  # Callable in shift
  def calculate_offset(date)
    offset_value = date.to_i * date.to_i
    offset_value.to_s[-4..-1] # 4 digit numeric string representing date offset
  end

  # Callable in Shift
  def find_key_shift(key)
    key_shift = {a: 0, b: 0, c: 0, d: 0}
    string_key = key.to_s if key.to_s.count("0123456789") == 5
    key_shift[:a] = string_key[0..1]
    key_shift[:b] = string_key[1..2]
    key_shift[:c] = string_key[2..3]
    key_shift[:d] = string_key[3..4]
    key_shift # Hash of key shifts a: to d:
  end

  def decrypt_helper(total_shift)
    neg_shift = Hash.new(0)
    total_shift.each do |k, v|
      neg_shift[k] = -1 * v
    end
    neg_shift.each_value.to_a # Array of total-neg-shifts a: ... d:
  end

  def find_total_shift_helper(key_shift, date_shift)
    key_shift.transform_values!(&:to_i) # Turns key shift values from strings to integers
    key_shift[:a] += date_shift[0].to_i
    key_shift[:b] += date_shift[1].to_i
    key_shift[:c] += date_shift[2].to_i
    key_shift[:d] += date_shift[3].to_i
    key_shift # Hash of total shifts with key being[:a .. :d], value being total shift integer
  end

  #Callable in Shift, combines 3 methods to return an array where array[0] = a:shift ... array[3] = d:shift
  def find_shift
    key_shift = find_key_shift(@key.key_value) # Hash
    date_shift = calculate_offset(@date.date) # 4 digit integer
    calculate_shift(key_shift, date_shift, @decrypt) # Array of total shifts[a..d]
  end

  #Callable in Shift, returns array where array[0] = a-shift ... array[3] = d-shift
  def calculate_shift(key_shift, date_shift, decrypt = false)
    total_shift = find_total_shift_helper(key_shift, date_shift)
    if decrypt
      decrypt_helper(total_shift) # Array of total-neg-shifts a: to d:
    else
      total_shift.each_value.to_a # Array of total-shifts a: to d:
    end
  end

  def character_set_a #Entire base character set shifted by a:shift
    @characters.rotate(find_shift[0])
  end

  def character_set_b #Entire base character set shifted by b:shift
    @characters.rotate(find_shift[1])
  end

  def character_set_c #Entire base character set shifted by c:shift
    @characters.rotate(find_shift[2])
  end

  def character_set_d #Entire base character set shifted by d:shift
    @characters.rotate(find_shift[3])
  end

  def encrypt_character_set_a(msg_character, msg_char_index) # Returns individual shifted character
    if (msg_char_index + 4) % 4 == 0 # Verifies that the message's character directly correlates to the first of the 4 character shifts.
      msg_character_base_index = @characters.index(msg_character) if @characters.index(msg_character) != nil# Finds the message character letters' index position within the base characters' array.
      if msg_character_base_index
        character_set_a[msg_character_base_index] # Using the (above mentioned)index position to retrieve the corresponding character in the already shifted (1 of 4)character set.
      else msg_character
      end
    end
  end

  def encrypt_character_set_b(msg_character, msg_char_index)
    if (msg_char_index + 3) % 4 == 0 # Verifies that the message's character directly correlates to the second of the 4 character shifts.
      msg_character_base_index = @characters.index(msg_character) if @characters.index(msg_character) != nil# Finds the message character letters' index position within the base characters' array.
      if msg_character_base_index
        character_set_b[msg_character_base_index] # Using the (above mentioned)index position to retrieve the corresponding character in the already shifted (2 of 4)character set.
      else msg_character
      end
    end
  end

  def encrypt_character_set_c(msg_character, msg_char_index)
    if (msg_char_index + 2) % 4 == 0 # Verifies that the message's character directly correlates to the third of the 4 character shifts.
      msg_character_base_index = @characters.index(msg_character) if @characters.index(msg_character) != nil# Finds the message character letters' index position within the base characters' array.
      if msg_character_base_index
        character_set_c[msg_character_base_index] # Using the (above mentioned)index position to retrieve the corresponding character in the already shifted (3 of 4)character set.
      else msg_character
      end
    end
  end

  def encrypt_character_set_d(msg_character, msg_char_index)
    if (msg_char_index + 1) % 4 == 0 # Verifies that the message's character directly correlates to the fourth of the 4 character shifts.
      msg_character_base_index = @characters.index(msg_character) if @characters.index(msg_character) != nil # Finds the message character letters' index position within the base characters' array.
      if msg_character_base_index
        character_set_d[msg_character_base_index] # Using the (above mentioned)index position to retrieve the corresponding character in the already shifted (4 of 4)character set.
      else msg_character
      end
    end
  end

end
