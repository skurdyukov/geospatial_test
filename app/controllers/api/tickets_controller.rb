module Api
  class TicketsController < ApplicationController
    protect_from_forgery with: :null_session

    def create
      validation_result = TicketContract.new.call(params.permit!.to_h)

      if validation_result.success?
        CreateTicket.call!(params)

        head :created
      else
        render json: Api::CreateTicketErrors.render(validation_result.errors.messages, root: :errors),
               status: :unprocessable_entity
      end
    end
  end
end
