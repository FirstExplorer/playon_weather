class WeatherController < ApplicationController
  def search; end

  def index
    weather_service = Openweathermap::Service::Weather.new
    @weathers = weather_service.city(params[:search][:city])
    @city     = @weathers['city']['name']
  end

  def details
    @city     = params[:city]
    @weather  = params[:weather]

    respond_to do |format|
      format.js
    end
  end
end
