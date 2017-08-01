def swap_name(name)
  name = name.downcase.split(" ")
  name[0], name[-1] = name[-1], name[0]
  name
end

def next_vowel(vowel, vowels)
  if vowels.index(vowel) == 4
    vowel[0]
  else
    vowels[vowels.index(vowel) + 1]
  end
end

def next_char_except_vowels(char, vowels)
  if vowels.include?(char.next)
    char.next.next
  else
    char.next
  end
end

def fake_name(name)
  fake_name = []
  name = swap_name(name)
  vowels = "aeiou"
  name.each do |value|
    place_holder = []
    value.chars.each do |letter|
      if vowels.include?(letter)
          place_holder << next_vowel(letter, vowels)
      else
        place_holder << next_char_except_vowels(letter, vowels)
      end
    end
    fake_name << place_holder.join("").capitalize!
  end
  fake_name.join(" ")
end

def create_fake_name
  created_names = {}
  loop do
    puts "Please input a name. (exit by typing 'quit')"
    input = gets.chomp
    if input.strip.empty?
      next
    elsif input == "quit"
      created_names.each do |name,fake_name|
        puts "#{fake_name} is actually #{name}"
      end
      break
    else
      puts created_names[input] = fake_name(input)
    end
  end
end

create_fake_name
