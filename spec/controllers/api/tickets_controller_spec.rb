require "rails_helper"

RSpec.describe '/api/tickets', type: :request do
  describe 'POST /api/tickets' do
    let(:create_ticket_json) { Rails.root.join('spec/fixtures/files/ticket.json').read }
    let(:headers) { { "Content-Type" => "application/json" } }
    
    context 'when all required parameters are presented and have valid values' do
      it 'returns 201 Created' do
        post '/api/tickets', headers: headers, params: create_ticket_json

        expect(response).to have_http_status(:created)
      end

      it 'creates a ticket' do
        expect { post '/api/tickets', headers: headers, params: create_ticket_json }
          .to change { Ticket.count }.from(0).to(1)
      end

      it 'creates an excavator' do
        expect { post '/api/tickets', headers: headers, params: create_ticket_json }
          .to change { Excavator.count }.from(0).to(1)
      end
    end

    context 'when required parameters are missing' do
      let(:create_ticket_json) { "" }

      it 'returns 422 Unprocessable entity' do
        post '/api/tickets', headers: headers, params: create_ticket_json

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns errors messages' do
        post '/api/tickets', headers: headers, params: create_ticket_json
        parsed_response = JSON.parse(response.body)

        expect(parsed_response['errors']).to be_present
      end

      it 'does not create a ticket' do
        expect { post '/api/tickets', headers: headers, params: create_ticket_json }
          .not_to change { Ticket.count }
      end
    end
  end
end
