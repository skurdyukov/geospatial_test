require "rails_helper"

RSpec.describe CreateTicket do
  let(:parsed_json) do
    create_ticket_json = Rails.root.join('spec/fixtures/files/ticket.json').read

    JSON.parse(create_ticket_json)
  end

  it 'creates a ticket' do
    expect { described_class.call!(parsed_json) }.to change { Ticket.count }.from(0).to(1)
  end

  it 'creates an excavator' do
    expect { described_class.call!(parsed_json) }.to change { Excavator.count }.from(0).to(1)
  end

  it 'returns ticket' do
    expect(described_class.call!(parsed_json)).to be_a(Ticket)
  end

  it 'saves ticket attributes' do
    ticket = described_class.call!(parsed_json)

    expect(ticket.request_number).to                eq(parsed_json['RequestNumber'])
    expect(ticket.request_type).to                  eq(parsed_json['RequestType'])
    expect(ticket.request_action).to                eq(parsed_json['RequestAction'])
    expect(ticket.response_due_date_time).to        eq(parsed_json['DateTimes']['ResponseDueDateTime'])
    expect(ticket.primary_service_area_code).to     eq(parsed_json['ServiceArea']['PrimaryServiceAreaCode']['SACode'])
    expect(ticket.additional_service_area_codes).to eq(parsed_json['ServiceArea']['AdditionalServiceAreaCodes']['SACode'])
    expect(ticket.well_known_text_shape).to         eq(parsed_json['ExcavationInfo']['DigsiteInfo']['WellKnownText'])
  end

  it 'saves excavator attributes' do
    ticket = described_class.call!(parsed_json)
    excavator = ticket.excavators.first

    expect(excavator.ticket).to eq(ticket)
    expect(excavator.company_name).to eq(parsed_json['Excavator']['CompanyName'])
    expect(excavator.crew_on_site).to eq(cast_boolean(parsed_json['Excavator']['CrewOnsite']))
    expect(excavator.full_address).to include(parsed_json['Excavator']['Address'])
    expect(excavator.full_address).to include(parsed_json['Excavator']['City'])
    expect(excavator.full_address).to include(parsed_json['Excavator']['Zip'])
    expect(excavator.full_address).to include(parsed_json['Excavator']['State'])
  end

  def cast_boolean(value)
    ActiveRecord::Type::Boolean.new.cast(value)
  end
end
