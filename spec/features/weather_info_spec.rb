require 'rails_helper'

RSpec.describe 'Weather info', type: :feature do
  describe 'User can see weather info' do
    let(:term) { 'Fortaleza' }

    it 'User view current weather info', :vcr do
      VCR.use_cassette('weather/weathers/fortaleza') do
        visit weather_index_path(search: { city: term })

        expect(page).to have_content(term)
        expect(page).to have_selector(%(a), count: 8)
        expect(page).to have_selector(%(img), count: 8)
        expect(page).to have_content(I18n.t('search.link_root'))
      end
    end

    it 'User can see another weather days', vcr: true, js: true do
      VCR.use_cassette('weather/weathers/fortaleza') do
        visit weather_index_path(search: { city: term })

        expect(page).to have_content('Sunday')
        expect(page).to have_content('30˚c')
        expect(page).to have_content('9.51')

        click_link('day_Tue')
        wait_for_ajax

        expect(page).to have_content('Tuesday')
        expect(page).to have_content('28.64˚c')
        expect(page).to have_content('7.42')

      end
    end
  end
end
