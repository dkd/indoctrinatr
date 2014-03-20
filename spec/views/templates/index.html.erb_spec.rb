require 'spec_helper'

describe "templates/index" do
  before(:each) do
    assign(:templates, Kaminari.paginate_array(create_list(:template, 2)).page(1))
  end

  it "renders a list of templates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => /Name/, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
