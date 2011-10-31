require "spec_helper"

describe GatesController do
  describe "routing" do

    it "routes to #index" do
      get("/gates").should route_to("gates#index")
    end

    it "routes to #new" do
      get("/gates/new").should route_to("gates#new")
    end

    it "routes to #show" do
      get("/gates/1").should route_to("gates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/gates/1/edit").should route_to("gates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/gates").should route_to("gates#create")
    end

    it "routes to #update" do
      put("/gates/1").should route_to("gates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gates/1").should route_to("gates#destroy", :id => "1")
    end

  end
end
