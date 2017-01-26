# Encrypt Method Pseudocode:

# 1. Takes string argument
# 2. Turns string into array
# 3. Calls next method on each character in array unless character=="z" in which case result=="a"
# 4. Add to string
# 5. Returns string

def encrypt(string_to_increment)
	encrypted_string = ""
	array_to_increment = string_to_increment.split("")
	for x in array_to_increment
		if x=="z"
			encrypted_string += "a"
		else
			encrypted_string += x.next
		end
	end
	return encrypted_string
end

# Decrypt Method Pseudocode:

# 1. Create ALPHABET constant: "abcdefghijklmnopqrstuvwxyz"
# 2. Takes string argument
# Turns string into array
# 3. Run index method on ALPHABET with each element of array as an argument,
# decrease by one, then retrieve each character from ALPHABET with new decreased index.
# 4. Add character to decrypted_string
# 5. Returns string

ALPHABET = "abcdefghijklmnopqrstuvwxyz"

def decrypt(string_to_decrement)
	decrypted_string = ""
	array_to_decrement = string_to_decrement.split("")
	for x in array_to_decrement
		decrypted_string += ALPHABET[ALPHABET.index(x) - 1]
	end
	return decrypted_string
end

# Pseudocode for user question and answer

puts "Would you like to encrypt or decrypt a password? (encrypt/decrypt)"
encrypt_decrypt_pref = gets.chomp

puts "What is the password?"
password = gets.chomp

if encrypt_decrypt_pref == "encrypt"
	puts encrypt(password)
else
	puts decrypt(password)
end



# Call below calls encryct on "swordfish" with result "txpsegjti" and then calls
# decrypt on "txpsegjti" with result "swordfish"

# puts decrypt(encrypt("swordfish"))
