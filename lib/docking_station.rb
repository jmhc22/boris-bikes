require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20
  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
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
    @bikes.size >= @capacity ? true : false
  end

end
