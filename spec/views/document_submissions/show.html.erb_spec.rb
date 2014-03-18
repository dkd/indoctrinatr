require 'spec_helper'

describe "document_submissions/show" do
  before(:each) do
    @document_submission = assign(:document_submission, stub_model(DocumentSubmission,
      :template => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
