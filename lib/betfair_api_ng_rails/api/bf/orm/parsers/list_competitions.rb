module BetfairApiNgRails
  module Api
    module BF
      module ORM
        module Parsers
          class ListCompetitions

            attr_reader :responser

            def initialize(responser)
              @responser = responser
            end

            def process
              fetch_result_json.map { |json_row| process_row json_row }
            end

          private

            def fetch_result_json
              responser.has_error? ? [] : responser.result["result"]
            end

            def process_row(json_row)
              Api::BF::Data::CompetitionResult.from_json json_row
            end

          end
        end
      end
    end
  end
end