require 'rails_helper'

RSpec.describe "Invites", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/invites/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/invites/create"
      expect(response).to have_http_status(:success)
    end
  end

end
