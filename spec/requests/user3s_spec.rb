require 'rails_helper'

RSpec.describe "User3s", :type => :request do
  describe "GET /user3s" do
    it "works! (now write some real specs)" do
      get user3s_path
      expect(response).to have_http_status(200)
    end
  end
end
