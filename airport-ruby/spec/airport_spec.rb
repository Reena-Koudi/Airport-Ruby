require 'airport'


describe Airport do
  subject(:airport) { Airport.new }
  let(:plane1) { double("plane1") }
  let(:plane2) { double("plane2") }


  describe 'When weather is sunny' do
    before do
      allow(airport.weather).to receive(:stormy?).and_return(false)
    end

    context '#land' do
      it 'instructs the plane to land' do
        expect(airport.land(plane1)).to eq([plane1])
      end

      it 'Prevent landing when airport is full' do
        Airport::DEFAULT_CAPACITY.times { airport.land(plane1) }
        expect{ airport.land(plane2) }.to raise_error 'Airport capacity is full'
      end
    end

    context '#take_off' do
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

    describe 'When weather is stormy' do
      before do
        allow(airport.weather).to receive(:stormy?).and_return(true)
      end

      context '#land' do
        it 'Prevents the plane from landing if stormy' do
          expect{ airport.land(plane1) }.to raise_error 'Landing cancelled due to bad weather'
        end
      end

     context '#take_off' do
       it 'Prevent the plane from take_off if stormy' do
         allow(airport.weather).to receive(:stormy?).and_return(false)
         airport.land(plane1)
         allow(airport.weather).to receive(:stormy?).and_return(true)
         expect{ airport.take_off(plane1) }.to raise_error 'Take_off cancelled due to bad weather'
       end
     end
   end
 end
