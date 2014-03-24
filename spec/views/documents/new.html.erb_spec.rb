require 'spec_helper'

describe "documents/new" do
  before(:each) do
    assign(:document, stub_model(Document,
      :document_submission => nil
    ).as_new_record)
  end

  it "renders new document form" do
    pending
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", documents_path, "post" do
      assert_select "input#document_document_submission[name=?]", "document[document_submission]"
    end
  end
end
