names = ["John", "Bob", "Caroline"]

puts "This will capitalize names."

names.each do |name|
  puts name.upcase!
end

puts "Now the names are capitalized!"

Fruits = ["banana", "melon", "apple", "grape"]

Alter_egos = {
  'Clark Kent': 'Superman',
  'Logan': 'Wolverene',
  'Peter Parker': 'Spiderman',
  'Tony Stark': 'Iron Man'
  
}

Fruits.each do |fruit|
  puts fruit + "s"
end

puts "A list of multiple fruits:"

Fruits.map! do |fruit|
  puts fruit + "s"
end

Alter_egos.each do |real_name, superhero|
  puts "Shh, don't tell anyone but #{real_name} is actually #{superhero}."
end

#Release 2, Question 1
odd_numbers = (1..10).to_a.reject! { |number| number % 2 == 0}
puts odd_numbers

Alter_egos.reject! { |real_name| real_name.length < 6 }

Alter_egos.each do |real_name, superhero|
  puts "Shh, don't tell anyone but #{real_name} is actually #{superhero}."
end

#Release 2, Question 2
less_than_5 = (1..10).to_a.select { |i| i < 5 }
puts less_than_5

Alter_egos.select { |real_name| real_name.length > 5 }
puts Alter_egos

#Release 2, Question 3
double_numbers = (1..10).to_a.find_all { |number| number <= 5}
puts double_numbers

Alter_egos.find_all { |real_name| real_name.length > 5}

#Release 2, Question 4
 less_than_10 = (1..20).drop_while { |num| num < 10}
puts less_than_10

# Fruits.drop_while { |fruit| fruit.length > 5 }
Alter_egos.drop_while { |real_name| real_name.length > 5 }
puts Alter_egos