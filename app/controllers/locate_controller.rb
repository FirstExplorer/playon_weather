class LocateController < ApplicationController
  def search
    place_service = Google::Service::Place.new
    cities = place_service.cities(params[:term])

    respond_to do |format|
      format.json do
        render json: cities['predictions'].map { |city| city['description'] }
      end
    end
  end
end
