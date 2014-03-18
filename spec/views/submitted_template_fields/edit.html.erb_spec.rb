require 'spec_helper'

describe "submitted_template_fields/edit" do
  before(:each) do
    @submitted_template_field = assign(:submitted_template_field, stub_model(SubmittedTemplateField,
      :document_submission => nil,
      :template_field => nil,
      :value => "MyString"
    ))
  end

  it "renders the edit submitted_template_field form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", submitted_template_field_path(@submitted_template_field), "post" do
      assert_select "input#submitted_template_field_document_submission[name=?]", "submitted_template_field[document_submission]"
      assert_select "input#submitted_template_field_template_field[name=?]", "submitted_template_field[template_field]"
      assert_select "input#submitted_template_field_value[name=?]", "submitted_template_field[value]"
    end
  end
end
