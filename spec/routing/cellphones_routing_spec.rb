require "spec_helper"

describe CellphonesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/cellphones" }.should route_to(:controller => "cellphones", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/cellphones/new" }.should route_to(:controller => "cellphones", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/cellphones/1" }.should route_to(:controller => "cellphones", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/cellphones/1/edit" }.should route_to(:controller => "cellphones", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/cellphones" }.should route_to(:controller => "cellphones", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/cellphones/1" }.should route_to(:controller => "cellphones", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/cellphones/1" }.should route_to(:controller => "cellphones", :action => "destroy", :id => "1")
    end

  end
end
