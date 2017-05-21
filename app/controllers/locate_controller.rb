class LocateController < ApplicationController
  def search
    place_service = Google::Service::Place.new
    cities = place_service.cities(params[:term])

    respond_to do |format|
      format.json do
        render json: cities['predictions'].map { |city|
          { label: city['description'],
            value: autocomplete_value(city['terms']) }
        }
      end
    end
  end

  private

  def autocomplete_value(terms)
    "#{terms.first['value']}, #{terms.last['value']}"
  end
end
