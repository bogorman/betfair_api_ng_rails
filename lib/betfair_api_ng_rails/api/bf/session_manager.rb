require 'betfair_api_ng_rails/api/bf/concerns/errorable'

module BetfairApiNgRails
  module Api
    module BF
      class SessionManager
        class << self
          include Api::BF::Concerns::Errorable
          include Api::BF::Constants

          def ssoid
            @ssoid ||= fetch_ssoid
          end

          def request_ssoid
            ssoid
            !has_errors?
          end

          def expire_ssoid
            @ssoid = nil
          end

        private

          def fetch_ssoid
            process_response get_login_response
          end

          def process_response(response)
            response['sessionToken']
          end

          def get_login_response
            http_requester.do_request.result
          end

          def http_requester
            @_http_requester ||= Api::BF::Http::Factory.session_requester
          end

        end
      end
    end
  end
end