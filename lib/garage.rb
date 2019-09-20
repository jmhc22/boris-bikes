class Garage

  attr_accessor :broken_bikes, :working_bikes

  def initialize
    @broken_bikes = []
    @working_bikes = []
  end

  def receive_bikes(van)
    @broken_bikes += van.offload_bikes
  end

  def fix_bikes
    @working_bikes.push(@broken_bikes[0)
  end


end
