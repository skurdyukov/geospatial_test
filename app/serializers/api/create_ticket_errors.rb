module Api
  class CreateTicketErrors < Blueprinter::Base
    fields :path, :text
  end
end