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
end
