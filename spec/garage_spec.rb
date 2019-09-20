require 'garage'

describe Garage do

  describe "#receive_bikes" do
    it 'receives bikes from a van' do
      van = double(:van, offload_bikes: ['bike'])
      garage = Garage.new
      garage.receive_bikes(van)
      expect(garage.broken_bikes).to include 'bike'
    end
  end

  describe "#fix_bikes" do
    it 'it takes broken bikes and exports to the working bike array' do
      garage = Garage.new
      bike = double(:bike, working?: false)
      garage.broken_bikes += Array.new(5) { bike }
      garage.fix_bikes
      expect(garage.working_bikes.size).to eq 5
    end

    it 'fixes broken bikes' do
      garage = Garage.new
      bike = double(:bike, working: false)
      garage.broken_bikes += [bike]
      garage.fix_bikes
      expect(garage.working_bikes[0].working).to eq true
    end

  end
end
