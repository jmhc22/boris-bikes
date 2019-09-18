require_relative 'bike'

class DockingStation
  attr_accessor :bike

  def release_bike
    if @bike == nil
      raise "NoBikeError"
    else
      Bike.new
    end
  end

  def dock_bike(bike)
    if @bike == nil
      @bike = bike
    else
      raise "DockOccupiedError"
    end
  end

end
