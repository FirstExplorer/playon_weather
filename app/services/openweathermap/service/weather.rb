module Openweathermap
  module Service
    class Weather < Openweathermap::Support::Service
      def city(locate)
        service.response(locate: locate)
      end
    end
  end
end
