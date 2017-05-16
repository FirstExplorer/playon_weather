require "rails_helper"

RSpec.describe "Search city", type: :feature do
  describe "User can search a city" do
    let(:term) { 'fortaleza' }

    before do
      visit weather_path
    end

    it "User can view list of cities", js: true, vcr: true do
      VCR.use_cassette("weather_controller/cities/fortaleza") do
        fill_in :search_city, with: term

        page.execute_script %Q{ $('#search_city').trigger('focus') }
        page.execute_script %Q{ $('#search_city').trigger('keydown') }

        wait_for_ajax

        expect(page).to have_content('City')
      end
    end
  end
end
