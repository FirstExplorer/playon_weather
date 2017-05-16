module Google
  module Service
    class Place < Google::Support::Service
      def cities(term)
        service.response(input: term, types: 'cities')
      end
    end
  end
end
