class AstronautsController < ApplicationController

  def index
    @astronauts = Astronaut.all
    @missions_in_order = Mission.sorted_by_alpha
  end
end
