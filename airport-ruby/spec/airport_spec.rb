require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { Airport.new }
  let(:plane1) { Plane.new(700) }
  let(:plane2) { Plane.new(400) }

  describe '#land'do
    it 'instructs the plane to land' do
      expect(airport.land(plane1)).to eq([plane1])
    end
  end

  describe '#take_off' do
    it 'instructs one plane to land and take_off' do
      airport.land(plane1)
      expect(airport.take_off(plane1)).to eq([])
    end
    it 'it confirms the plane has taken off and no longer in airport' do
      airport.land(plane1)
      airport.land(plane2)
      expect(airport.take_off(plane1)).to eq([plane2])
    end
  end
end
