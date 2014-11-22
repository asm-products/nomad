class Api::V1::ReviewsController < ApplicationController
  respond_to :json

  def create
    @review = Review
      .create(params)

    respond_with @review
  end
end
