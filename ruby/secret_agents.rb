
#set counter variable to 0
#create loop so while counter is less than the length of the string, it will use the next method on the string.
#set counter variable to increment by one 
#return string 

def encrypt(string)
  counter = 0
  while counter < string.length
    if string[counter] == "z"
      string[counter] = "a"
    else
    string[counter] = string[counter].next
    end
    counter += 1
  end
  string
end

#set counter variable to 0
#create loop so while counter is less than the length of the string, it will use the index method on the string to figure out the letter before.
#set counter variable to increment by one
#return string

def decrypt(string)
  counter = 0
  while counter < string.length
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    string[counter] = alphabet[alphabet.index(string[counter]) - 1]
    counter += 1
  end 
  string
end

# encrypt("abc") 
# encrypt("zed") 
# decrypt("bcd") 
# decrypt("afe")

# print decrypt(encrypt("swordfish"))

puts "Would you like to encrypt or decrypt a password?"
answer = gets.chomp 
puts "What is the password?"
password = gets.chomp
if answer == "encrypt"
  encrypt(password)
else
  decrypt(password)
end 

print password