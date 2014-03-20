require "spec_helper"

describe DocumentSubmissionsController do
  describe "routing" do

    it "routes to #index" do
      get("/document_submissions").should route_to("document_submissions#index")
    end

    it "routes to #new" do
      get("/document_submissions/new").should route_to("document_submissions#new")
    end

    it "routes to #edit" do
      get("/document_submissions/1/edit").should route_to("document_submissions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/document_submissions").should route_to("document_submissions#create")
    end

    it "routes to #update" do
      put("/document_submissions/1").should route_to("document_submissions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/document_submissions/1").should route_to("document_submissions#destroy", :id => "1")
    end

  end
end
