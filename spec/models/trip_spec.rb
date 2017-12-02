require 'spec_helper'
require 'pry'


RSpec.describe Trip do
  describe 'Class Methods' do
    describe '.duration' do
      it 'returns the duration of the trip' do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", start_station_name: "Train", end_date: "50-54-2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

       expect(trip.duration).to eq(5)
      end
    end

    describe '.start_date' do
      it 'returns the start date of the trip' do
        date = DateTime.new(5-14-2010)
        trip = Trip.create!(duration: "5", start_date: date, start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 1)

        expect(trip.start_date).to eq("-2019-01-01 00:00:00 UTC")
      end
    end

    describe '.start_station_name' do
      it 'returns the name of the start station' do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", start_station_name: "Train", end_date: "50-54-2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

        expect(trip.start_station_name).to eq("Train")
      end
    end

    describe '.end_date' do
      it 'returns the end date of the trip' do
        date = DateTime.new(5-14-2010)
        trip = Trip.create!(duration: "5", start_date: date, start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 1)

        expect(trip.end_date).to eq("-2019-01-01 00:00:00 UTC")
      end
    end

    describe '.end_station_name' do
      it 'returns the name of the end station' do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", start_station_name: "Train", end_date: "50-54-2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

       expect(trip.end_station_name).to eq("California")
      end
    end

    describe '.bike_id' do
      it 'returns the bike id of the trip' do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", start_station_name: "Train", end_date: "50-54-2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

        expect(trip.bike_id).to eq("540")
      end
    end

    describe '.subscription_type' do
      it 'returns the subscription type of the user of the trip' do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", start_station_name: "Train", end_date: "50-54-2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

       expect(trip.subscription_type).to eq("Subscriber")
      end
    end

    describe '.zip_code' do
      it 'returns the zip code of the trip' do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", start_station_name: "Train", end_date: "50-54-2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

       expect(trip.zip_code).to eq("80219")
      end
    end

    describe "validations" do
      it "is invalid without a duration" do
        trip = Trip.create(start_date: "05-14-2010", start_station_name: "Train", end_date: "50-54-2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

        expect(trip).to be_invalid
      end

      it "is invalid without a start date" do
        trip = Trip.create(duration: "5", start_station_name: "Train", end_date: "50-54-2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

        expect(trip).to be_invalid
      end

      it "is invalid without a start station name" do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", end_date: "50-54-2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

        expect(trip).to be_invalid
      end

      it "is invalid without an end date" do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", start_station_name: "Train", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

        expect(trip).to be_invalid
      end

      it "is invalid without an end station name" do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", start_station_name: "Train", end_date: "50-54-2010", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

        expect(trip).to be_invalid
      end

      it "is invalid without a bike id" do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", start_station_name: "Train", end_date: "50-54-2010", end_station_name: "California", subscription_type: "Subscriber", zip_code: "80219")

        expect(trip).to be_invalid
      end

      it "is invalid without a subscription type" do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", start_station_name: "Train", end_date: "50-54-2010", end_station_name: "California", bike_id: "540", zip_code: "80219")

        expect(trip).to be_invalid
      end
    end
  end
end
