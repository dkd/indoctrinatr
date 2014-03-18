require 'spec_helper'

describe "submitted_template_fields/show" do
  before(:each) do
    @submitted_template_field = assign(:submitted_template_field, stub_model(SubmittedTemplateField,
      :document_submission => nil,
      :template_field => nil,
      :value => "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Value/)
  end
end
