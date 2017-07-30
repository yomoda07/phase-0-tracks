=begin
- declear a hash
- Ask user cliant's information
- if the information is number, convert the type of it to integer.
- store the information to the hash I defined at first
- print the hash
- ask user if they want to update.
- if user doesn't type "none"
  - ask user new value.
  - update to the new value.
- print the updated hash

=end

cliant = {}

puts "What is the cliant's name?"
cliant[:name] = gets.chomp

puts "How old is the cliant?"
cliant[:age] = gets.chomp.to_i

puts "How many children does your cliant have?"
cliant[:children] = gets.chomp.to_i

puts "What kind of decor theme does the cliant like?"
cliant[:decor_theme] = gets.chomp

puts cliant

puts "What item dou you like to update? (if no problem, type 'none')"
answer = gets.chomp.to_sym

if answer != :none
  puts "What do you change it to?"
  if cliant[answer].is_a? Integer
    cliant[answer] = gets.chomp.to_i
  else
    cliant[answer] = gets.chomp
  end
end

puts cliant
