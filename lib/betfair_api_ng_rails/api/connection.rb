module BetfairApiNgRails
  module Api
    class Connection
      
      attr_reader :ssoid

      def initialize
        request_ssoid
      end

      def request(method, params = {})
        provider.fetch method: method, params: params
      end

    protected

      def provider
        @_provider ||= BetfairApiNgRails::Api::Provider.new ssoid
      end

      def request_ssoid
        @ssoid = BetfairApiNgRails::Api::SessionManager.new_ssoid
      end

    end
  end
end