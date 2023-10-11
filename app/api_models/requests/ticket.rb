module Requests
  class Ticket < Base
    property :request_number, from: "RequestNumber"

    property :request_type, from: "RequestType"

    property :request_action, from: "RequestAction"

    property :response_due_date_time,
             from: "DateTimes",
             with: ->(value) { value&.dig('ResponseDueDateTime') }

    property :primary_service_area_code,
             from: 'ServiceArea',
             with: ->(value) { value&.dig('PrimaryServiceAreaCode', 'SACode') }

    property :additional_service_area_codes,
             from: 'ServiceArea',
             with: ->(value) { value&.dig('AdditionalServiceAreaCodes', 'SACode') },
             coerce: Array[String]

    property :well_known_text_shape,
             from: 'ExcavationInfo',
             with: ->(value) { value&.dig('DigsiteInfo', 'WellKnownText') }
  end
end
