require 'rails_helper'

RSpec.describe 'Search city', type: :feature do
  describe 'User can search a city' do
    let(:term)          { 'Fortaleza' }
    let(:selected_city) { 'Fortaleza - State of Ceará, Brazil' }

    before do
      visit search_weather_index_path
    end

    it 'User can view content of search page' do
      expect(page).to have_content(I18n.t('general.welcome.title'))
      expect(page).to have_content(I18n.t('general.welcome.description'))
      expect(page).to have_content(I18n.t('search.title'))
      expect(page).to have_content(I18n.t('search.description'))
    end

    it 'User can view list of cities', js: true, vcr: true do
      VCR.use_cassette('locate/cities/fortaleza') do
        fill_autocomplete :search_city, with: term, select: selected_city

        expect(page).to have_content("City")
      end
    end
  end
end
