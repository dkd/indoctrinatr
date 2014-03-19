require 'spec_helper'

describe "document_submissions/edit" do
  before(:each) do
    @document_submission = assign(:document_submission, stub_model(DocumentSubmission,
      :template => nil
    ))
  end

  it "renders the edit document_submission form" do
    pending
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", document_submission_path(@document_submission), "post" do
      assert_select "input#document_submission_template[name=?]", "document_submission[template]"
    end
  end
end
