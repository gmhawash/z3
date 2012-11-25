require 'spec_helper'

describe "specifications/index.html.haml" do
  before(:each) do
    assign(:specifications, [
      stub_model(Specification,
        :name => "Name",
        :radix => 1,
        :variables => 1,
        :content => "MyText",
        :complete => "MyText"
      ),
      stub_model(Specification,
        :name => "Name",
        :radix => 1,
        :variables => 1,
        :content => "MyText",
        :complete => "MyText"
      )
    ])
  end

  it "renders a list of specifications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
