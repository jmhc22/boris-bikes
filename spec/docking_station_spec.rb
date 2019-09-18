require 'docking_station'

describe DockingStation do

  undocked_station = DockingStation.new
  docked_station = DockingStation.new
  docked_station.dock_bike(Bike.new)

  describe '#release_bike' do
    # responds to release_bike method
    it { expect(docked_station).to respond_to(:release_bike) }
    # returns an instance of Bike
    # it { expect(docked_station.release_bike).to be_a Bike }
    it { expect(docked_station.release_bike).to respond_to(:working?) }
    it "raises an error if no bikes are available" do
      expect { undocked_station.release_bike }.to raise_error("NoBikeError")
    end
 end

  describe '#dock_bike' do
    # should respond to dock_bike method
    it { expect(docked_station).to respond_to(:dock_bike) }
    # should assign a bike instance to the @bike variable of a DockingStation instance
    it { expect(docked_station.bike).to be_a Bike }

    it "raises an error if bike is already docked" do
      expect { docked_station.dock_bike(Bike.new)}.to raise_error("DockOccupiedError")
    end
  end

  describe '#bike' do
    it { expect(docked_station).to respond_to(:bike) }
  end

end
