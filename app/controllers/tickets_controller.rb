class TicketsController < ApplicationController
  def index
    @tickets = Ticket.order(id: :desc)
  end

  def show
    @ticket = Ticket.find(params[:id])
    @coordinates = normalize_coordinates(@ticket.well_known_text_shape)
  end

  private

  # FIXME: refactor to postgis extension
  # https://github.com/rgeo/activerecord-postgis-adapter
  # https://medium.com/biggerpockets-product-engineering/adding-postgis-support-to-rails-6-a56476f42486
  def normalize_coordinates(well_known_text_shape)
    normalizing_coords = well_known_text_shape.gsub("POLYGON((", "").gsub("))", "")
                                              .split(",")
                                              .map { |k| "[" + k.gsub(" ", ",") + "]" }
                                              .join(",")

    "[#{normalizing_coords}]"
  end 
end
