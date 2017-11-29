RSpec.describe Station do
  describe 'Class Methods' do
    describe '.name' do
      it 'returns the name of the station' do
       Station.create(name: "This station", dock_count: 23, city: "San Francisco", installation_date: "04-03-1204")

       expect(Station.name).to eq("This station")
      end
    end
  end
end
