class Api::V2::DestinationsController < ApplicationController
  def index
    destinations = Destination.all
    render json: DestinationSerializer.format_destinations(destinations)
  end
end