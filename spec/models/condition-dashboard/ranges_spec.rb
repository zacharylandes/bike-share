require 'spec_helper'

RSpec.describe Condition do
  describe 'Class Methods' do
    describe '.range' do
      it 'shows the precipitation range' do
        expect(Condition.precipitation_range(0)).to eq([0..0.5])
      end
    end
    describe '.temp_range' do
      it 'shows the temperature range' do
        expect(Condition.temp_range(20)).to eq([20..29])
      end
    end
    describe '.wind_range' do
      it 'shows the wind range' do
        expect(Condition.wind_range(20)).to eq([20..24])
      end
    end
  end
end
