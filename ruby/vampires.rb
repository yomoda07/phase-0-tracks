puts "How many candidates will be processed?"
candidates = gets.chomp.to_i

candidates.times do
  puts "What is your name?"
  candidate_name = gets.chomp

  puts "How old are you?"
  age = gets.chomp.to_i

  puts "What year were you born?"
  birth_year = gets.chomp.to_i

  puts "Our company cafeteria serves garlic bread. Should we order some for you? y/n"
  answer = gets.chomp
  answer == "y" ? garlic = true : garlic = false

  puts "Would you like to enroll in the company’s health insurance? y/n"
  answer = gets.chomp
  answer == "y" ? health_insuarance = true : health_insuarance = false

  age == Time.now.year - birth_year ? age_accuracy = true : age_accuracy = false

  puts "Name allergy if you have, then hit 'done' when finished."
  allergy = nil
  loop do
    allergy = gets.chomp
    break if allergy == "done" || allergy == "sunshine"
    puts "Do you have any other allergies?"
  end

if allergy == "sunshine"
  result = "Probably a vampire."
else
  result = nil
  if age_accuracy && (garlic || insurance)
    result =  "Probably not a vampire."
  end

  if !age_accuracy && !(garlic && health_insuarance)
    result = "Probably a vampire."
  end
end

  if !age_accuracy && !(garlic || health_insuarance)
    result = "Almost certainly a vampire."
  end

  if candidate_name == "Drake Cula" || candidate_name == "Tu Fang"
    result = "Definitely a vampire."
  end
  if result.nil?
    result = "Results inconclusive."
  end

  puts result
end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."

