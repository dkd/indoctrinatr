require 'spec_helper'

describe "SubmittedTemplateFields" do
  describe "GET /submitted_template_fields" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get submitted_template_fields_path
      response.status.should be(200)
    end
  end
end
