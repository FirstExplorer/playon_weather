require "rails_helper"

RSpec.describe WeatherController, type: :controller do
  describe "#index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "#search_city" do
    let(:term) { 'Lucan' }

    it "retuns json of cities", :vcr do
      VCR.use_cassette("weather_controller/cities/lucan") do
        get :search_city, params: { term: term }, format: :json

        expect(response.status).to eq(200)
        expect(response.body).to include(term)
      end
    end
  end
end
