require 'docking_station'

describe DockingStation do

  docking_station = DockingStation.new
  docking_station.dock_bike(Bike.new)

  describe '#release_bike' do
    # responds to release_bike method
    it { expect(docking_station).to respond_to(:release_bike) }
    # returns an instance of Bike
    it { expect(docking_station.release_bike).to be_a Bike }
 end

  describe '#dock_bike' do
    # should respond to dock_bike method
    it { expect(docking_station).to respond_to(:dock_bike) }
    # should assign a bike instance to the @bike variable of a DockingStation instance
    it { expect(docking_station.bike).to be_a Bike }
  end

  describe '#bike' do
    it { expect(docking_station).to respond_to(:bike) }
  end

  describe '#release_bike' do
    # raises and error if there is not bike docked at the station
    it "raises an error if no bikes are available" do
      docking_station = DockingStation.new
      expect { docking_station.release_bike }.to raise_error("NoBikeError")
    end
  end

end
