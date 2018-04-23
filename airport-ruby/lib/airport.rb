require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :weather
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    raise 'Landing cancelled due to bad weather' if weather.stormy?
    raise 'Airport capacity is full' if @hangar.length == DEFAULT_CAPACITY
    @hangar.push(plane)
  end

  def take_off(plane)
    raise 'Take_off cancelled due to bad weather' if weather.stormy?
    raise 'Sorry the plane is already flying' if flying?(plane)
    @hangar.delete(plane)
    @hangar
  end

  private
  def flying?(plane)
    !@hangar.include?(plane)
  end
end
