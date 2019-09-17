require 'bike'

describe Bike do

  bike = Bike.new

  describe '#release_bike' do
     it { expect(bike).to respond_to(:working?) }
  end

end
