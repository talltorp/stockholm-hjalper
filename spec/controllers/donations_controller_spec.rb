require 'rails_helper'

RSpec.describe DonationsController, :type => :controller do

  describe "POST create" do
    it "returns http success" do
      post :create, {}
      expect(response).to have_http_status(:success)
    end
  end

end
