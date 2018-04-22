require 'weather'

describe Weather do
  subject(:weather) { Weather.new }

  describe '#stormy?' do
    it 'checks the weather if it is stormy' do
      allow(weather).to receive(:weather_generator).and_return(:stormy)
      expect(weather.stormy?).to eq(true)
    end

    it 'checks the weather if it is sunny' do
      allow(weather).to receive(:weather_generator).and_return(:sunny)
      expect(weather.stormy?).to eq(false)
    end
  end
end
