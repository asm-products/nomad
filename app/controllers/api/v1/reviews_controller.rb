class Api::V1::ReviewsController < ApplicationController
  respond_to :json

  def create
    @review = Review
      .create_with_placeid(params[:place_id])

    respond_with @review
  end
end
