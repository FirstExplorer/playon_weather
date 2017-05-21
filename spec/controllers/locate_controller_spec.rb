require 'rails_helper'

RSpec.describe LocateController, type: :controller do
  describe '#search' do
    let(:term) { 'Lucan' }

    it 'retuns json of cities', :vcr do
      VCR.use_cassette('locate/cities/lucan') do
        get :search, params: { term: term }, format: :json

        expect(response.status).to eq(200)
        expect(response.body).to include(term)
      end
    end
  end
end
