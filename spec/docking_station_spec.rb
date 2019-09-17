require 'docking_station'

describe DockingStation do

  docking_station = DockingStation.new

  describe '#release_bike' do
     it { expect(docking_station).to respond_to(:release_bike) }

     # returns instance of bikes
     it { expect(docking_station.release_bike.class).to eq Bike}

  end

end
