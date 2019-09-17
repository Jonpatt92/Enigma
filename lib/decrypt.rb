require 'pry'
require './lib/enigma'
#: Takes 4 arguments
#: The first is an existing file that contains an encrypted message.
#: The second is a file where your program should write the decrypted message.
#: The third is the key to be used for decryption.
#: The fourth is the date to be used for decryption.

# Command Line Interface
#$ ruby ./lib/encrypt.rb message.txt encrypted.txt
#Created 'encrypted.txt' with the key 82648 and date 240818

#$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
#Created 'decrypted.txt' with the key 82648 and date 240818

message_path = ARGV[0]
message_file = File.open(message_path, 'r')
encrypted = message_file.readlines(chomp: true)
encrypted_message = encrypted[0]
encrypted_key = encrypted[1]
encrypted_date = encrypted[2]


enigma = Enigma.new
decryption = enigma.decrypt(encrypted_message, encrypted_key, encrypted_date) # Could use ARGV[2] & ARGV[3] IF they are entered correctly.
decrypted_message = decryption[:decryption]
decrypted_file = ARGV[1]

File.open("#{decrypted_file}", "w+") do |f|
  f.write("#{decrypted_message}")
end

puts "Created '#{decrypted_file}' with the key #{decryption[:key]} and date #{decryption[:date]}"
