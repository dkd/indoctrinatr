require 'spec_helper'

describe "submitted_template_fields/new" do
  before(:each) do
    assign(:submitted_template_field, stub_model(SubmittedTemplateField,
      :document_submission => nil,
      :template_field => nil,
      :value => "MyString"
    ).as_new_record)
  end

  it "renders new submitted_template_field form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", submitted_template_fields_path, "post" do
      assert_select "input#submitted_template_field_document_submission[name=?]", "submitted_template_field[document_submission]"
      assert_select "input#submitted_template_field_template_field[name=?]", "submitted_template_field[template_field]"
      assert_select "input#submitted_template_field_value[name=?]", "submitted_template_field[value]"
    end
  end
end
