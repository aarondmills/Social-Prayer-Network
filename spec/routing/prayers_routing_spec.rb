require "spec_helper"

describe PrayersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/prayers" }.should route_to(:controller => "prayers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/prayers/new" }.should route_to(:controller => "prayers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/prayers/1" }.should route_to(:controller => "prayers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/prayers/1/edit" }.should route_to(:controller => "prayers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/prayers" }.should route_to(:controller => "prayers", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/prayers/1" }.should route_to(:controller => "prayers", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/prayers/1" }.should route_to(:controller => "prayers", :action => "destroy", :id => "1")
    end

  end
end
