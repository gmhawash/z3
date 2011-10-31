require 'spec_helper'

describe "circuits/index.html.haml" do
  before(:each) do
    assign(:circuits, [
      stub_model(Circuit,
        :title => "Title",
        :content => ""
      ),
      stub_model(Circuit,
        :title => "Title",
        :content => ""
      )
    ])
  end

  it "renders a list of circuits" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
