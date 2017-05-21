module WeatherHelper
  def formated_weather(weather)
    "#{weather}˚c"
  end

  def week_day(time)
    Time.at(time).strftime('%a')
  end

  def city_and_week_day(city, time)
    "#{city} - #{Time.at(time).strftime('%A')}"
  end
end
