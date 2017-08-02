# module Shout
#   def self.yell_angrily(words)
#     words + "!!!" + " :("
#   end
#
#   def self.yelling_happily(words)
#     words + "!! :)"
#   end
# end
#
# p Shout.yell_angrily("Shoot")
# p Shout.yelling_happily("Sweet")


module Shout
  def yell_angrily(words)
    words + "!!!" + " :("
  end

  def yelling_happily(words)
    words + "!! :)"
  end
end

class Human
  include Shout
end

class Dog
  include Shout
end

human = Human.new
p human.yelling_happily("Awesome")

dog = Dog.new
p dog.yell_angrily("Woof")
