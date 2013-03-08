require 'spec_helper'

describe "gates/index.html.haml" do
  before(:each) do
    assign(:gates, [
      stub_model(Gate,
        :name => "Name",
        :image => "",
        :symbol => "Symbol"
      ),
      stub_model(Gate,
        :name => "Name",
        :image => "",
        :symbol => "Symbol"
      )
    ])
  end

  it "renders a list of gates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Symbol".to_s, :count => 2
  end
end
