require './lib/enigma'
#Additionally, create a Runner file called crack.rb that takes three command line arguments.
# The first is an existing file that contains an encrypted message.
# The second is a file where your program should write the cracked message.
# The third is the date to be used for cracking. In addition to writing the cracked message to the file, your program should output to the screen the file it wrote to, the key used for cracking, and the date used for cracking

#$ ruby ./lib/encrypt.rb message.txt encrypted.txt
#Created 'encrypted.txt' with the key 82648 and date 240818

#$ ruby ./lib/crack.rb encrypted.txt cracked.txt 240818
#Created 'cracked.txt' with the cracked key 82648 and date 240818

message_path = ARGV[0]
message_file = File.open(message_path, 'r')
encrypted = message_file.readlines(chomp: true)
encrypted_message = encrypted[0]
# encrypted_date = encrypted[2]
if ARGV[2] == encrypted[2]
  encrypted_date = ARGV[2]
else
  encrypted_date = encrypted[2]
end
# binding.pry
enigma = Enigma.new
cracked_hash = enigma.crack(encrypted_message, encrypted_date) # Could use ARGV[2] & ARGV[3] IF they are entered correctly.
cracked_message = cracked_hash[:decryption]
cracked_file = ARGV[1]

File.open("#{cracked_file}", "w+") do |f|
  f.write("#{cracked_message}")
end

puts "Created '#{cracked_file}' with the cracked key #{cracked_hash[:key]} and date #{cracked_hash[:date]}"
