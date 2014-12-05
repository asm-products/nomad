require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :controller do
  describe "POST create" do
    context "when it's a valid user" do
      let(:user_params) do
        {
          first_name: "Roberto",
          last_name: "Bolaños",
          email: "bolanos@trashmail.com"
        }
      end

      it "should create a new user" do
        expect {
          post :create, user: user_params, format: :json
        }.to change { User.count }.by(1)
      end

      it "should return the new user" do
        post :create, user: user_params, format: :json
        user = JSON.parse(response.body)
        expect(user["email"]).to be_eql(user_params[:email])
      end
    end

    context "when it's an invalid user" do
      let(:user_params) do
        { email: "bolanos@trashmail.com" }
      end

      it "should not create a new user" do
        expect {
          post :create, user: user_params, format: :json
        }.to change { User.count }.by(0)
      end

      it "should return the user errors" do
        post :create, user: user_params, format: :json
        user = JSON.parse(response.body)
        expect(user["first_name"]).to be_eql(["can't be blank"])
      end
    end
  end
end
