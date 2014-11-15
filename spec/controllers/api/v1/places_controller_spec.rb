require 'rails_helper'

RSpec.describe Api::V1::PlacesController, :type => :controller do
  describe "GET search" do
    let(:inside_params) { { radius: 15000, lat: -23.0058447, lng: -43.3214268 } }
    let(:out_of_range_params) { { radius: 100, lat: -23.0058447, lng: -43.3214268 } }

    before do
      @starbucks_ipanema = Place.make! lat: -22.9857647, lng: -43.2073231
      @starbucks_downtown = Place.make! lat: -23.005616, lng: -43.3202978
    end

    context "when there is no place for the given parameters" do
      it "should return an empty array" do
        get :search, out_of_range_params.merge(format: :json)
        places = JSON.parse(response.body)
        expect(places).to be_empty
      end
    end

    context "when there are some places for the given parameters" do
      it "should return those places ordered by distance" do
        get :search, inside_params.merge(format: :json)
        places = JSON.parse(response.body)
        expect(places.map{|p| p["id"]}).to eq([@starbucks_downtown.id, @starbucks_ipanema.id])
      end
    end
  end
end
