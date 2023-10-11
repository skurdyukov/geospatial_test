class TicketContract < Dry::Validation::Contract
  params do
    required(:RequestNumber).filled(:string)
    required(:RequestType).filled(:string)
    required(:RequestAction).filled(:string)

    required(:DateTimes).schema do
      required(:ResponseDueDateTime).filled(:string)
    end

    required(:ServiceArea).schema do
      required(:PrimaryServiceAreaCode).schema do
        required(:SACode).filled(:string)
      end

      required(:AdditionalServiceAreaCodes).schema do
        required(:SACode).array(:str?)
      end
    end

    required(:Excavator).schema do
      required(:CompanyName).filled(:string)
      required(:Address).filled(:string)
      required(:City).filled(:string)
      required(:State).filled(:string)
      required(:Zip).filled(:string)
      required(:CrewOnsite).filled(:string)
    end

    required(:ExcavationInfo).schema do
      required(:DigsiteInfo).schema do
        required(:WellKnownText).filled(:string)
      end
    end
  end

  # TODO: add rule(:WellKnownText) https://dry-rb.org/gems/dry-validation/1.10/
end
