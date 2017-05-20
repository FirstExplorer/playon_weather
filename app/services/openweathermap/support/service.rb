module Openweathermap
  module Support
    class Service
      require 'open-uri'

      def response(params)
        JSON.load(open(hash_url(params)))
      end

      private

      def service
        Openweathermap::Support::Service.new
      end

      def hash_url(params)
        url     = 'http://api.openweathermap.org/data/2.5/forecast/daily'
        locate  = I18n.transliterate(params[:locate])
        key     = Rails.application.secrets.openweathermap_api[:key]
        days     = 7

        "#{url}?q=#{locate}&mode=json&units=metric&cnt=#{days}&APPID=#{key}"
      end
    end
  end
end
