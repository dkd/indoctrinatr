require 'spec_helper'

describe "document_submissions/index" do
  before(:each) do
    assign(:document_submissions, Kaminari.paginate_array([
      stub_model(DocumentSubmission,
        template: FactoryGirl.create(:template),
        document: FactoryGirl.create(:document)
      ),
      stub_model(DocumentSubmission,
        template: FactoryGirl.build(:template),
        document: FactoryGirl.create(:document)
      )
    ]).page(1))
  end

  it "renders a list of document_submissions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => /Name/, :count => 2
  end
end
