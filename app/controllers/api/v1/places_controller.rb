class Api::V1::PlacesController < ApplicationController
  respond_to :json

  def search
    @places = Place
      .within_radius(params[:radius], params[:lat], params[:lng])
      .order_by_distance(params[:lat], params[:lng])

    respond_with @places
  end
end
