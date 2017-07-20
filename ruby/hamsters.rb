# Data about the hamster:

puts "What is the hamster's name?"
name = gets.chomp
puts "On a scale of 1 to 10 (10 being the loudest), how noisy is #{name}?"
noise = gets.chomp.to_i
puts "What is #{name}'s fur color?"
color = gets.chomp
puts "Is #{name} good for adoption? (y/n)"
adoption = gets.chomp
puts "How old is #{name}?"
age = gets.chomp
  
if age == ""
  age = nil
else
  age = age.to_i
end

puts "1) Hamster's name is #{name}."
puts "2) #{name}'s noise level is #{noise}."
puts "3) #{name}'s fur color is #{color}."
if adoption == "y"
  puts "4) #{name} is good for adoption."
else
  puts "4) #{name} is not good for adoption."
end
if age == nil
  puts "5) #{name}'s age is unknown."
else
  puts "5) #{name} is #{age} years old."
end