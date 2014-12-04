class Api::V1::ReviewsController < ApplicationController
  before_filter :authenticate, only: [:create]

  def create
    review = Review.new review_params
    review.user_id = current_user.id

    if review.save
      render json: review
    else
      render json: review.errors
    end
  end

  def review_params
    params.require(:review).permit(:place_id)
  end
end
