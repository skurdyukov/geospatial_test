module Requests
  class Excavator < Base
    property :company_name, from: 'Excavator', with: ->(value) { value&.dig('CompanyName') }

    property :full_address, from: 'Excavator', with: ->(value) { transform_to_full_address(value) }

    property :crew_on_site, from: 'Excavator', with: ->(value) { value&.dig('CrewOnsite') }

    private

    def self.transform_to_full_address(excavator_data)
      [
        excavator_data['Address'],
        excavator_data['City'],
        excavator_data['Zip'],
        excavator_data['State']
      ].join(', ')
    end
  end
end
