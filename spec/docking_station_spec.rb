require 'docking_station'
describe DockingStation do

  subject(:docking_station) { described_class.new }

  describe "#initialize" do
    it { expect(DockingStation.new(5).capacity).to eq 5 }
    it { expect(DockingStation.new.capacity).to eq 20 }
  end

  describe '#release_bike' do
    # responds to release_bike method
    it { expect(docking_station).to respond_to(:release_bike) }
    # returns an instance of Bike
    # it { expect(docked_station.release_bike).to be_a Bike }
    it "occupied docking station will release working bike" do
      docking_station.dock_bike(Bike.new)
      expect(docking_station.release_bike).to respond_to(:working?)
    end
    it "raises an error if no bikes are available" do
      expect { docking_station.release_bike }.to raise_error("NoBikesError")
    end
 end

  describe '#dock_bike' do
    # should respond to dock_bike method
    it { expect(docking_station).to respond_to(:dock_bike) }
    # should assign a bike instance to the @bike variable of a DockingStation instance
    it "raises an error if 20 bikes are already docked" do
      DockingStation::DEFAULT_CAPACITY.times { docking_station.dock_bike(Bike.new) }
      expect { docking_station.dock_bike(Bike.new)}.to raise_error("FullyOccupiedError")
    end
    it "dock_bike stores a bike object as an instance variable of docking_station" do
      docking_station.dock_bike(Bike.new)
      expect(docking_station.bikes[0]).to be_a Bike
    end
  end

  describe '#bike' do
    it { expect(docking_station).to respond_to(:bikes) }
  end

end
