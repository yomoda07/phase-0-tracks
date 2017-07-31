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
  fake_name = swap_name(name)
  vowels = "aiueo"
  fake_name.each_with_index do |value, x|
    value.length.times do |i|
      if vowels.include?(value[i])
          fake_name[x][i] = next_vowel(value[i], vowels)
      else
        fake_name[x][i] = next_char_except_vowels(fake_name[x][i], vowels)
      end
    end
    fake_name[x].capitalize!
  end
  fake_name.join(" ")
end

def create_fake_name
  created_names = {}
  loop do
    puts "Please input a name. (exit by typing 'quit')"
    input = gets.chomp
    next if input.strip.empty?

    if input == "quit"
      created_names.each do |name,fake_name|
        puts "#{fake_name} is actually #{name}"
      end
      break
    end
    puts created_names[input] = fake_name(input)
  end
end

create_fake_name
