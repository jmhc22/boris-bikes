require 'bike'

describe Bike do

  subject(:bike) { described_class.new }

  describe '#working?' do
    it { expect(bike).to be_working }
  end

  describe '#report_broken' do
    it "when bike is reported as broken, #working? will return false" do
      bike.report_broken
      expect(bike).to_not be_working
    end

  end

end
