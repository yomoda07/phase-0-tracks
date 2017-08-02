class Santa
  attr_reader :age, :ethnicity
  attr_accessor :gender
  def initialize(gender, ethnicity)
    puts "Initializing Santa instance ..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer",
                         "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = rand(0..140)
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end

  def celebrate_birthday
    @age = @age + 1
  end

  def get_mad_at(reindeer)
    @reindeer.delete(reindeer)
    @reindeer_ranking << reindeer
  end
end

# santas = []
# example_santas = {
#   "agender" => "black",
#   "female" => "Latino",
#   "bigender" => "white",
#   "male" => "Japanese",
#   "female" => "prefer not to say",
#   "gender fluid" => "Mystical Creature (unicorn)"
#
# }
# example_santas.each do |gender, ethnicity|
#   santas << Santa.new(gender,ethnicity)
# end

# example_santa = Santa.new("male", "Japanese")
# p example_santa.age
# p example_santa.ethnicity
# p example_santa.gender = "female"

santas = []
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
1000.times do |i|
  santa = Santa.new(example_genders.sample, example_ethnicities.sample)
  puts "A new santa is: Gender: #{santa.gender}, Ethnicity: #{santa.ethnicity}, Age: #{santa.age}"
end
