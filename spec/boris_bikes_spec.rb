require 'boris_bikes'

describe DockingStation do

  docking_station = DockingStation.new

  describe '#release_bike' do
     it { docking_station.release_bike }
  end
end
