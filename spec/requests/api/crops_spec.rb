require 'rails_helper'

RSpec.describe "Api::Crops", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/api/crops/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/api/crops/create"
      expect(response).to have_http_status(:success)
    end
  end

end
