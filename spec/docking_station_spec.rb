require 'docking_station'

describe DockingStation do

  docking_station = DockingStation.new

  describe '#release_bike' do
     it { expect(docking_station).to respond_to(:release_bike) }

     it { expect(docking_station.release_bike.class).to eq Bike}
  end

  describe '#dock_bike' do
     docking_station.dock_bike(Bike.new)
     it { expect(docking_station).to respond_to(:dock_bike) }
     it { expect(docking_station.bike.class).to eq Bike}
  end

  describe '#bike' do
     it { expect(docking_station).to respond_to(:bike) }
  end

end
