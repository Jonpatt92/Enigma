require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_encrypt
    expected_hash = {
                     encryption: "keder ohulw",
                     key: "02715",
                     date: "040895"
                     }

     assert_equal expected_hash, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt
    expected_hash = {
                      decryption: "hello world",
                      key: "02715",
                      date: "040895"
                      }

    assert_equal expected_hash, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_with_no_date
    encrypted_hash = @enigma.encrypt("hello world", "02715")
    encrypted_message = encrypted_hash[:encryption]
    encrypted_date = encrypted_hash[:date]
    encrypted_key = encrypted_hash[:key]
    todays_date = Date.today.strftime("%d%m%y")

    assert_equal 11, encrypted_message.length
    assert_equal todays_date, encrypted_date
    assert_equal "02715", encrypted_key
  end

  def test_it_can_decrypt_with_no_date
    encrypted_hash = @enigma.encrypt("hello world", "02715")
    encrypted_message = encrypted_hash[:encryption]
    todays_date = Date.today.strftime("%d%m%y")
    decrypted_hash = @enigma.decrypt(encrypted_message, "02715")
    decrypted_message = decrypted_hash[:decryption]
    decrypted_date = decrypted_hash[:date]
    decrypted_key = decrypted_hash[:key]

    assert_equal "hello world", decrypted_message
    assert_equal todays_date, decrypted_date
    assert_equal "02715", decrypted_key
  end

  def test_it_can_encrypt_with_no_key
    encrypted_hash = @enigma.encrypt("hello world", "130592")
    encrypted_message = encrypted_hash[:encryption]
    encrypted_date = encrypted_hash[:date]
    encrypted_key = encrypted_hash[:key]


    assert_equal 11, encrypted_message.length
    assert_equal "130592", encrypted_date
    assert_equal 5, encrypted_key.count("0123456789")
  end

  def test_it_can_decrypt_with_no_key
    @enigma.encrypt("hello world", "130592")
    decrypted_hash = @enigma.decrypt
    decrypted_message = decrypted_hash[:decryption]
    decrypted_date = decrypted_hash[:date]
    decrypted_key = decrypted_hash[:key]

    assert_equal "hello world", decrypted_message
    assert_equal "130592", decrypted_date
    assert_equal 5, decrypted_key.count("0123456789")
  end

  def test_it_can_encrypt_with_no_key_or_date
    encrypted_hash = @enigma.encrypt("hello world")
    encrypted_message = encrypted_hash[:encryption]
    encrypted_date = encrypted_hash[:date]
    encrypted_key = encrypted_hash[:key]
    todays_date = Date.today.strftime("%d%m%y")

    assert_equal 11, encrypted_message.length
    assert_equal todays_date, encrypted_date
    assert_equal 5, encrypted_key.count("0123456789")
  end

  def test_it_can_decrypt_with_no_key_or_date
    encrypted_hash = @enigma.encrypt("hello world")
    encrypted_message = encrypted_hash[:encryption]
    encrypted_key = encrypted_hash[:key]

    decrypted_hash = @enigma.decrypt(encrypted_message)

    decrypted_message = decrypted_hash[:decryption]
    decrypted_date = decrypted_hash[:date]
    decrypted_key = decrypted_hash[:key]
    todays_date = Date.today.strftime("%d%m%y")

    assert_equal "hello world", decrypted_message
    assert_equal todays_date, decrypted_date
    assert_equal encrypted_key, decrypted_key
  end

  def test_it_can_encrypt_with_special_characters
    expected_hash = {
                     encryption: "keder ohulw!!!!",
                     key: "02715",
                     date: "040895"
                     }

     assert_equal expected_hash, @enigma.encrypt("hello world!!!!", "02715", "040895")
  end

  def test_it_can_decrypt_with_special_characters
    expected_hash = {
                      decryption: "hello world!!!!",
                      key: "02715",
                      date: "040895"
                      }

    assert_equal expected_hash, @enigma.decrypt("keder ohulw!!!!", "02715", "040895")
  end

  def test_it_can_crack
    @enigma.encrypt("hello world end", "08304", "291018")
    expected_decryption = { decryption: "hello world end", date: "291018", key: "08304" }

    assert_equal expected_decryption, @enigma.crack("vjqtbeaweqihssi", "291018")
  end

  def test_it_can_crack_with_special_characters
    @enigma.encrypt("Hello!!!! end", "130592")
    expected_decryption = { :decryption=>"hello!!!! end", :key=>"14471", :date=>"130592" }

    assert_equal expected_decryption, @enigma.crack("vzkfb!!!!udhr", "130592")
  end

end
