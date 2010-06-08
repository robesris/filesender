require 'spec_helper'

describe UlFilesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/ul_files" }.should route_to(:controller => "ul_files", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/ul_files/new" }.should route_to(:controller => "ul_files", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/ul_files/1" }.should route_to(:controller => "ul_files", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/ul_files/1/edit" }.should route_to(:controller => "ul_files", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/ul_files" }.should route_to(:controller => "ul_files", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/ul_files/1" }.should route_to(:controller => "ul_files", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/ul_files/1" }.should route_to(:controller => "ul_files", :action => "destroy", :id => "1") 
    end
  end
end
