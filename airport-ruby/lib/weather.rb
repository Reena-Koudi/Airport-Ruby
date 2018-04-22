class Weather

  def weather_generator
    [:sunny, :sunny, :sunny, :sunny, :stormy].sample
  end

  def stormy?
    weather_generator == :stormy
  end
  
end
