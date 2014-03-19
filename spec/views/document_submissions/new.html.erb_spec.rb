require 'spec_helper'

describe "document_submissions/new" do
  before(:each) do
    assign(:document_submission, stub_model(DocumentSubmission,
      :template => nil
    ).as_new_record)
  end

  it "renders new document_submission form" do
    pending
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", document_submissions_path, "post" do
      assert_select "input#document_submission_template[name=?]", "document_submission[template]"
    end
  end
end
