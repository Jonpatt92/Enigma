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
    skip
    encrypted = @enigma.encrypt("hello world", "02715")
    expected_hash = # decryption hash here

    assert_equal expected_hash, @enigma.decrypt(encrypted[:encryption], "02715")
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

  def test_it_can_encrypt_with_no_key_or_date
    skip
    expected_hash = # Encryption hash here

    assert_equal expected_hash, @enigma.encrypt("hello world")
  end
end
