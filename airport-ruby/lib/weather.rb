class Weather

  def weather_generator
    value = rand(4)
    value >= 1 ? :sunny : :stormy
  end

end
