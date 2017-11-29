require 'spec_helper'
require 'pry'
RSpec.describe Station do
  describe 'Class Methods' do
    describe '.name' do
      it 'returns the name of the station' do
       station = Station.create(name: "The station", dock_count: 23, city: "San Francisco", installation_date: "04-03-1204")

       expect(station.name).to eq("The station")
      end
    end

    describe '.dock_count' do
      it 'returns the dock count of the station' do
       station = Station.create(name: "The station", dock_count: 23, city: "San Francisco", installation_date: "04-03-1204")

       expect(station.dock_count).to eq(23)
      end
    end

    describe '.city' do
      it 'returns the city of the station' do
       station = Station.create(name: "The station", dock_count: 23, city: "San Francisco", installation_date: "04-03-1204")

       expect(station.city).to eq("San Francisco")
      end
    end

    describe '.installation_date' do
      it 'returns the installation date of the station' do
       station = Station.create(name: "The station", dock_count: 23, city: "San Francisco", installation_date: "04-03-1204")

       expect(station.installation_date).to eq("04-03-1204")
      end
    end
  end

  describe "validations" do
    it "is invalid without a name" do
      station = Station.new(dock_count: 23, city: "San Francisco", installation_date: "04-03-1204")

      expect(station).to be_invalid
    end

    it "is invalid without a dock_count" do
      station = Station.new(name:"jimmy", city: "San Francisco", installation_date: "04-03-1204")

      expect(station).to be_invalid
    end

    it "is invalid without a city" do
      station = Station.new(name: "jim jim", dock_count: 23, installation_date: "04-03-1204")

      expect(station).to be_invalid
    end

    it "is invalid without a installation_date" do
      station = Station.new(name:"jojo", dock_count: 23, city: "San Francisco")

      expect(station).to be_invalid
    end
  end

end
