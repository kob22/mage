require "spec_helper"

describe LabMarksController do
  describe "routing" do

    it "routes to #index" do
      get("/lab_marks").should route_to("lab_marks#index")
    end

    it "routes to #new" do
      get("/lab_marks/new").should route_to("lab_marks#new")
    end

    it "routes to #show" do
      get("/lab_marks/1").should route_to("lab_marks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lab_marks/1/edit").should route_to("lab_marks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lab_marks").should route_to("lab_marks#create")
    end

    it "routes to #update" do
      put("/lab_marks/1").should route_to("lab_marks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lab_marks/1").should route_to("lab_marks#destroy", :id => "1")
    end

  end
end
