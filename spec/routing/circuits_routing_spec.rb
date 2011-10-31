require "spec_helper"

describe CircuitsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/circuits" }.should route_to(:controller => "circuits", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/circuits/new" }.should route_to(:controller => "circuits", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/circuits/1" }.should route_to(:controller => "circuits", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/circuits/1/edit" }.should route_to(:controller => "circuits", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/circuits" }.should route_to(:controller => "circuits", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/circuits/1" }.should route_to(:controller => "circuits", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/circuits/1" }.should route_to(:controller => "circuits", :action => "destroy", :id => "1")
    end

  end
end
