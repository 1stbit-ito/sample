require "rails_helper"

RSpec.describe User3sController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user3s").to route_to("user3s#index")
    end

    it "routes to #new" do
      expect(:get => "/user3s/new").to route_to("user3s#new")
    end

    it "routes to #show" do
      expect(:get => "/user3s/1").to route_to("user3s#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user3s/1/edit").to route_to("user3s#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user3s").to route_to("user3s#create")
    end

    it "routes to #update" do
      expect(:put => "/user3s/1").to route_to("user3s#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user3s/1").to route_to("user3s#destroy", :id => "1")
    end

  end
end
