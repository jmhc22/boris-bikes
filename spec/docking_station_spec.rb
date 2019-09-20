require 'docking_station'
describe DockingStation do

  subject(:docking_station) { described_class.new }

  describe '#initialize' do
    it { expect(DockingStation.new(5).capacity).to eq 5 }
    it { expect(docking_station.capacity).to eq 20 }
  end

  describe '#release_bike' do
    # responds to release_bike method
    it { expect(docking_station).to respond_to(:release_bike) }
    # returns an instance of Bike
    # it { expect(docked_station.release_bike).to be_a Bike }
    it "occupied docking station will release working bike" do
      bike = double(:bike, working?: true)
      docking_station.dock_bike(bike)
      expect(docking_station.release_bike).to respond_to(:working?)
    end
    it "raises an error if no bikes are available" do
      expect { docking_station.release_bike }.to raise_error("NoBikesError")
    end

    it "docking station will not release a broken bikes" do
      broken_bike = double(:bike, working?: false)
      docking_station.dock_bike(broken_bike)
      expect { docking_station.release_bike }.to raise_error("NoWorkingBikes")
    end

    it "if at least one docked bike is working, this bike will be released" do
      broken_bike = double(:bike, working?: false)
      working_bike = double(:bike, working?: true)
      docking_station.dock_bike(broken_bike)
      docking_station.dock_bike(working_bike)
      expect(docking_station.release_bike).to eq working_bike
    end

    # it 'releases working bikes' do
    #   bike = double(:bike)
    #   docking_station.dock_bike(bike)
    #   allow(bike).to receive(:working?) { true } #.and_return
    #   bike = docking_station.release_bike
    #   expect(bike).to be_working
    # end

    it 'releases working bikes' do
      bike = double(:bike, working?: true)
      docking_station.dock_bike(bike)
      bike = docking_station.release_bike
      expect(bike).to be_working
    end


 end

  describe '#dock_bike' do
    # should respond to dock_bike method
    it { expect(docking_station).to respond_to(:dock_bike) }
    # should assign a bike instance to the @bike variable of a DockingStation instance
    it "raises an error if 20 bikes are already docked" do
      bike = double(:bike)
      described_class::DEFAULT_CAPACITY.times { docking_station.dock_bike(bike) }
      expect { docking_station.dock_bike(bike)}.to raise_error("FullyOccupiedError")
    end
    it "dock_bike stores a bike object as an instance variable of docking_station" do
      bike = double(:bike)
      docking_station.dock_bike(bike)
      expect(docking_station.bikes).to include bike
    end
    it "dock_bike docks bikes whether they are broken or not" do
      broken_bike = double(:bike, working?: false)
      docking_station.dock_bike(broken_bike)
      expect(docking_station.bikes).to include broken_bike
    end
  end

  describe '#bike' do
    it { expect(docking_station).to respond_to(:bikes) }
  end

end
