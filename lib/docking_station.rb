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

    bike_to_release = nil

    for b in 0...@bikes.size
      if @bikes[b].working?
        bike_to_release = @bikes[b]
        @bikes.delete_at(b)
        break
      end
    end
    fail "NoWorkingBikes" if bike_to_release == nil
    bike_to_release
  end

  def dock_bike(bike)
    fail "FullyOccupiedError" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.size >= @capacity
  end
end
