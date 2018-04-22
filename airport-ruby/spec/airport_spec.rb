require 'airport'


describe Airport do
  subject(:airport) { Airport.new }
  let(:plane1) { double("plane1") }
  let(:plane2) { double("plane2") }


  describe '#land'do
    it 'instructs the plane to land' do
      allow(airport.weather).to receive(:stormy?).and_return(false)
      expect(airport.land(plane1)).to eq([plane1])
    end

    it 'Prevents the plane from landing if stormy' do
      allow(airport.weather).to receive(:stormy?).and_return(true)
      expect{ airport.land(plane1) }.to raise_error 'Landing cancelled due to bad weather'
    end
  end

  describe '#take_off' do
    it 'instructs one plane to land and take_off' do
      allow(airport.weather).to receive(:stormy?).and_return(false)
      airport.land(plane1)
      allow(airport.weather).to receive(:stormy?).and_return(false)
      expect(airport.take_off(plane1)).to eq([])
    end
    it 'it confirms the plane has taken off and no longer in airport' do
      allow(airport.weather).to receive(:stormy?).and_return(false)
      airport.land(plane1)
      airport.land(plane2)
      allow(airport.weather).to receive(:stormy?).and_return(false)
      expect(airport.take_off(plane1)).to eq([plane2])
    end

    it 'Prevent the plane from take_off if stormy' do
      allow(airport.weather).to receive(:stormy?).and_return(false)
      airport.land(plane1)
      allow(airport.weather).to receive(:stormy?).and_return(true)
      expect{ airport.take_off(plane1) }.to raise_error 'Take_off cancelled due to bad weather'
    end
  end
end
