require 'rails_helper'

RSpec.describe WeatherController, type: :controller do
  describe '#search' do
    it 'renders the search template' do
      get :search
      expect(response).to render_template(:search)
    end

    it 'has a 200 status code' do
      get :search
      expect(response.status).to eq(200)
    end
  end

  describe '#index' do
    let(:term) { 'Lucan' }

    it 'renders the index template', :vcr do
      VCR.use_cassette('weather/weathers/lucan') do
        get :index, params: { search: { city: term } }

        expect(response.status).to eq(200)
        expect(response).to render_template(:index)
      end
    end
  end

  describe '#details' do
    it 'renders the details template', :vcr do
      VCR.use_cassette('weather/weathers/lucan') do
        post :details, format: :js

        expect(response.status).to eq(200)
        expect(response).to render_template(:details)
      end
    end
  end
end
