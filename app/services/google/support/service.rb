module Google
  module Support
    class Service
      require 'open-uri'

      def response(params)
        JSON.load(open(hash_url(params)))
      end

      private

      def service
        Google::Support::Service.new
      end

      def hash_url(params)
        url   = 'https://maps.googleapis.com/maps/api/place/autocomplete/json'
        types = "(#{params[:types]})"
        key   = Rails.application.secrets.google_api[:key]

        "#{url}?input=#{params[:input]}&types=#{types}&key=#{key}"
      end
    end
  end
end
