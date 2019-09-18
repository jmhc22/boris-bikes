require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "NoBikesError" if @bikes.empty?
    @bikes.pop
    Bike.new
  end

  def dock_bike(bike)
    fail "FullyOccupiedError" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.size >= 20 ? true : false
  end

end
