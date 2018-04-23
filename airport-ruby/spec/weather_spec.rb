require 'weather'

describe Weather do
  subject(:weather) { Weather.new }

  describe '#weather_generator'

    it 'checks the weather if it is sunny' do
      srand(1)
      expect(weather.weather_generator).to eq(:sunny)
    end
  end
