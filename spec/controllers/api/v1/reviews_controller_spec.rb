require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, :type => :controller do
  describe "POST create" do
    let(:place) { Place.make! }
    let(:user) { User.make! }

    context "when it's a valid API token" do
      before { request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(user.api_token) }

      context "when it's a valid review" do
        it "should create a new review" do
          expect {
            post :create, review: { place_id: place.id }, format: :json
          }.to change { Review.count }.by(1)
        end

        it "should return the new review" do
          post :create, review: { place_id: place.id }, format: :json
          review = JSON.parse(response.body)
          expect(review["place_id"]).to be_eql(place.id)
        end
      end

      context "when it's an invalid review" do
        it "should not create a new review" do
          expect {
            post :create, review: { place_id: nil }, format: :json
          }.to change { Review.count }.by(0)
        end

        it "should return the review errors" do
          post :create, review: { place_id: nil }, format: :json
          review = JSON.parse(response.body)
          expect(review["place_id"]).to be_eql(["can't be blank"])
        end
      end
    end

    context "when it's an invalid token" do
      it "should return unauthorized" do
        post :create, review: { place_id: 1 }, format: :json
        expect(response.status).to be_eql(401)
      end
    end
  end
end
