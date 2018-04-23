require 'airport'


describe Airport do
  subject(:airport) { Airport.new }
  let(:plane1) { double("plane1") }
  let(:plane2) { double("plane2") }


  describe 'When weather is sunny' do
    # before do
    #   allow(airport.weather).to receive(:stormy?).and_return(false)
    # end

    context '#land' do
      it 'instructs the plane to land' do
        expect(airport.land(plane1, :sunny)).to eq([plane1])
      end

      it 'Prevent landing when airport is full' do
        airport.capacity = 1
        airport.land(plane1, :sunny)
        expect{ airport.land(plane2, :sunny) }.to raise_error 'Airport capacity is full'
      end

      it 'Cannot land the plane which is already in hangar' do
        airport.land(plane1, :sunny)
        expect { airport.land(plane1, :sunny) }.to raise_error 'Sorry the plane is already in hangar'
      end
    end

    context '#take_off' do
      it 'instructs one plane to land and take_off' do
        airport.land(plane1, :sunny)
        expect(airport.take_off(plane1, :sunny)).to eq([])
      end

      it 'it confirms the plane has taken off and no longer in airport' do
        airport.land(plane1, :sunny)
        airport.land(plane2, :sunny)
        expect(airport.take_off(plane1, :sunny)).to eq([plane2])
      end

      it 'Cannot take_off the plane which is already flying' do
        airport.land(plane1, :sunny)
        airport.take_off(plane1, :sunny)
        expect{ airport.take_off(plane1, :sunny) }.to raise_error 'Sorry the plane is already flying'
      end
    end

  end

    describe 'When weather is stormy' do
      # before do
      #   allow(airport.weather).to receive(:stormy?).and_return(true)
      # end

      context '#land' do
        it 'Prevents the plane from landing if stormy' do
          expect{ airport.land(plane1, :stormy) }.to raise_error 'Landing cancelled due to bad weather'
        end
      end

     context '#take_off' do
       it 'Prevent the plane from take_off if stormy' do
         # allow(airport.weather).to receive(:stormy?).and_return(false)
         airport.land(plane1, :sunny)
         # allow(airport.weather).to receive(:stormy?).and_return(true)
         expect{ airport.take_off(plane1, :stormy) }.to raise_error 'Take_off cancelled due to bad weather'
       end
     end
   end
 end
