require './lib/enigma'

message_path = ARGV[0]
message_file = File.open(message_path, 'r')
message = message_file.read.chomp
message.delete! "\""

enigma = Enigma.new
encryption = enigma.encrypt(message)
encrypted_message = encryption[:encryption]
encrypted_file = ARGV[1]

File.open("#{encrypted_file}", "w+") do |f|
  f.write("#{encrypted_message}\n")
  f.write("#{encryption[:key]}\n")
  f.write("#{encryption[:date]}")
end

puts "Created '#{encrypted_file}' with the key #{encryption[:key]} and date #{encryption[:date]}"


#: Takes two command line arguments.
#: The first is an existing file that contains a message to encrypt.
#: The second is a file where your program should write the encrypted message.

# Command Line Interface
#$ ruby ./lib/encrypt.rb message.txt encrypted.txt
#Created 'encrypted.txt' with the key 82648 and date 240818
