require 'airport'
require 'plane'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  describe '#land'do
    it 'instructs the plane to land' do
      expect(airport.land(plane)).to eq(plane)
    end
  end

  describe '#take_off' do
    it 'instructs the plane to take-off' do
      airport.land(plane)
      expect(airport.take_off(plane)).not_to eq(plane)
    end
  end
end
