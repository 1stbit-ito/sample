require 'rails_helper'

RSpec.describe "User2s", :type => :request do
  describe "GET /user2s" do
    it "works! (now write some real specs)" do
      get user2s_path
      expect(response).to have_http_status(200)
    end
  end
end
