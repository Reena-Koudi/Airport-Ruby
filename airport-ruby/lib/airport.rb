require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :weather

  def initialize(weather = Weather.new)
    @hangar = []
    @weather = weather
  end

  def land(plane)
    @hangar.push(plane)
  end

  def take_off(plane)
    raise 'Take_off cancelled due to bad weather' if weather.stormy?
    @hangar.delete(plane)
    @hangar
  end

end
