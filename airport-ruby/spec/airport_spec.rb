require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  describe '#land'do
    it 'instructs the plane to land' do
      expect(airport.land(plane)).to eq(plane)
    end
  end
end
