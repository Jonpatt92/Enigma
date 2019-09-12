require './test/test_helper'
require 'date'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_equal Enigma, @enigma
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

  def test_it_can_encrypt_with_key
    expected_hash = # Encryption hash here

    assert_equal expected_hash, @enigma.encrypt("hello world", "02715") # Use today's date
  end

  def test_it_can_decrypt_with_key
    encrypted = @enigma.encrypt("hello world", "02715")
    expected_hash = # decryption hash here

    assert_equal expected_hash, @enigma.decrypt(encrypted[:encryption], "02715")
  end

  def test_it_can_encrypt_with_random_key_todays_date
    expected_hash = # Encryption hash here

    assert_equal expected_hash, @enigma.encrypt("hello world")
  end
end
