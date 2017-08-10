# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# require_relative refer to current directory, mostly used to bring in code from another file in the same directory.
# require uses absolute path. require is commonly used more than require_relative.

require_relative 'state_data'

class VirusPredictor

  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  #call predicted_deaths and speed_of_spread method
  def virus_effects
    puts "#{@state} will lose #{predicted_deaths} people in this outbreak and will spread across the state in #{speed_of_spread} months.\n\n"
  end

  private

  #calculate how many people will likely to be dead depends on population density and population
  def predicted_deaths
    # predicted deaths is solely based on population density
    if @population_density >= 200
      calculate_number_of_death(0.4)
    elsif @population_density >= 150
      calculate_number_of_death(0.3)
    elsif @population_density >= 100
      calculate_number_of_death(0.2)
    elsif @population_density >= 50
      calculate_number_of_death(0.1)
    else
      calculate_number_of_death(0.05)
    end
  end

  def calculate_number_of_death(percentage)
      number_of_deaths = (@population * percentage).floor
  end

  #calculate how fast virus will spread depends on population density
  def speed_of_spread
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0
    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

    speed
  end
end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

STATE_DATA.each do |state, value|
    state = VirusPredictor.new(state, value[:population_density], value[:population])
    state.virus_effects
end

# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects
#
# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects
#
# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects
#
# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects


#=======================================================================
# Reflection Section
