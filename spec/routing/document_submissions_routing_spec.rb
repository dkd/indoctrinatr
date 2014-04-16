require "spec_helper"

describe DocumentSubmissionsController do
  describe "routing" do

    it "routes to #index" do
      expect(get("/document_submissions")).to route_to("document_submissions#index")
    end

    it "routes to #new" do
      expect(get("/document_submissions/new")).to route_to("document_submissions#new")
    end

    it "routes to #create" do
      expect(post("/document_submissions")).to route_to("document_submissions#create")
    end

    it "routes to #destroy" do
      expect(delete("/document_submissions/1")).to route_to("document_submissions#destroy", :id => "1")
    end

  end
end
