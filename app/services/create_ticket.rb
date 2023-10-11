class CreateTicket
  class << self
    def call!(json_params)
      ticket = Ticket.new(normalized_ticket_params(json_params))

      ticket.transaction do
        ticket.save!
        ticket.excavators.create!(normalized_excavator_params(json_params))
      end

      ticket
    end

    private

    def normalized_ticket_params(json_params)
      Requests::Ticket.new(json_params)
    end

    def normalized_excavator_params(json_params)
      Requests::Excavator.new(json_params)
    end
  end
end
