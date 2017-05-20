require "rails_helper"

RSpec.describe WeatherHelper, type: :helper do
  describe "#formated_weather" do
    it "return formated weather" do
      degree = rand(1..30)
      
      expect(helper.formated_weather(degree)).to eql("#{degree}˚c")
    end
  end

  describe "#week_day" do
    it "return a week day of a time" do
      time = Time.new

      expect(helper.week_day(time)).to eql(time.strftime('%a'))
    end
  end

  describe "#city_and_week_day" do
    it "return formated city and week day" do
      time  = Time.new
      city  = Faker::Address.city

      expect(helper.city_and_week_day(city, time)).to eql("#{city} - #{time.strftime('%A')}")
    end
  end
end
