require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    if @bikes.length < 1
      raise "NoBikeError"
    else
      @bikes.pop
      Bike.new
    end
  end

  def dock_bike(bike)
    if @bikes.size >= 20
      raise "DockOccupiedError"
    else
      @bikes.push(bike)
    end
  end

end
