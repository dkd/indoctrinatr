require 'spec_helper'

describe "document_submissions/index" do
  before(:each) do
    assign(:document_submissions, [
      stub_model(DocumentSubmission,
        template: FactoryGirl.build(:template)
      ),
      stub_model(DocumentSubmission,
        template: FactoryGirl.build(:template)
      )
    ])
  end

  it "renders a list of document_submissions" do
    pending
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
