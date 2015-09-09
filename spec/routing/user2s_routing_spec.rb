require "rails_helper"

RSpec.describe User2sController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user2s").to route_to("user2s#index")
    end

    it "routes to #new" do
      expect(:get => "/user2s/new").to route_to("user2s#new")
    end

    it "routes to #show" do
      expect(:get => "/user2s/1").to route_to("user2s#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user2s/1/edit").to route_to("user2s#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user2s").to route_to("user2s#create")
    end

    it "routes to #update" do
      expect(:put => "/user2s/1").to route_to("user2s#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user2s/1").to route_to("user2s#destroy", :id => "1")
    end

  end
end
