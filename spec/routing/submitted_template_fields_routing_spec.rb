require "spec_helper"

describe SubmittedTemplateFieldsController do
  describe "routing" do

    it "routes to #index" do
      get("/submitted_template_fields").should route_to("submitted_template_fields#index")
    end

    it "routes to #new" do
      get("/submitted_template_fields/new").should route_to("submitted_template_fields#new")
    end

    it "routes to #show" do
      get("/submitted_template_fields/1").should route_to("submitted_template_fields#show", :id => "1")
    end

    it "routes to #edit" do
      get("/submitted_template_fields/1/edit").should route_to("submitted_template_fields#edit", :id => "1")
    end

    it "routes to #create" do
      post("/submitted_template_fields").should route_to("submitted_template_fields#create")
    end

    it "routes to #update" do
      put("/submitted_template_fields/1").should route_to("submitted_template_fields#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/submitted_template_fields/1").should route_to("submitted_template_fields#destroy", :id => "1")
    end

  end
end
