class AstronautsController < ApplicationController

  def index
    @astronauts = Astronaut.all
    @average_age = @astronauts.average_age.to_i
    
  end
end
