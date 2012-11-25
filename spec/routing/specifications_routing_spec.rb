require "spec_helper"

describe SpecificationsController do
  describe "routing" do

    it "routes to #index" do
      get("/specifications").should route_to("specifications#index")
    end

    it "routes to #new" do
      get("/specifications/new").should route_to("specifications#new")
    end

    it "routes to #show" do
      get("/specifications/1").should route_to("specifications#show", :id => "1")
    end

    it "routes to #edit" do
      get("/specifications/1/edit").should route_to("specifications#edit", :id => "1")
    end

    it "routes to #create" do
      post("/specifications").should route_to("specifications#create")
    end

    it "routes to #update" do
      put("/specifications/1").should route_to("specifications#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/specifications/1").should route_to("specifications#destroy", :id => "1")
    end

  end
end
