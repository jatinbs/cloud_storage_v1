require "rails_helper"

RSpec.describe TestObjectsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/test_objects").to route_to("test_objects#index")
    end

    it "routes to #new" do
      expect(:get => "/test_objects/new").to route_to("test_objects#new")
    end

    it "routes to #show" do
      expect(:get => "/test_objects/1").to route_to("test_objects#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/test_objects/1/edit").to route_to("test_objects#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/test_objects").to route_to("test_objects#create")
    end

    it "routes to #update" do
      expect(:put => "/test_objects/1").to route_to("test_objects#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/test_objects/1").to route_to("test_objects#destroy", :id => "1")
    end

  end
end
