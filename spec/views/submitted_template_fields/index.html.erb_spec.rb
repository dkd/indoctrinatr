require 'spec_helper'

describe "submitted_template_fields/index" do
  before(:each) do
    assign(:submitted_template_fields, [
      stub_model(SubmittedTemplateField,
        :document_submission => nil,
        :template_field => nil,
        :value => "Value"
      ),
      stub_model(SubmittedTemplateField,
        :document_submission => nil,
        :template_field => nil,
        :value => "Value"
      )
    ])
  end

  it "renders a list of submitted_template_fields" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
