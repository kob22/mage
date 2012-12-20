require "spec_helper"

describe LabClassesController do
  describe "routing" do

    it "routes to #index" do
      get("/lab_classes").should route_to("lab_classes#index")
    end

    it "routes to #new" do
      get("/lab_classes/new").should route_to("lab_classes#new")
    end

    it "routes to #show" do
      get("/lab_classes/1").should route_to("lab_classes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lab_classes/1/edit").should route_to("lab_classes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lab_classes").should route_to("lab_classes#create")
    end

    it "routes to #update" do
      put("/lab_classes/1").should route_to("lab_classes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lab_classes/1").should route_to("lab_classes#destroy", :id => "1")
    end

  end
end
