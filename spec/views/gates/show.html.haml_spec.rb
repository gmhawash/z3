require 'spec_helper'

describe "gates/show.html.haml" do
  before(:each) do
    @gate = assign(:gate, stub_model(Gate,
      :name => "Name",
      :image => "",
      :symbol => "Symbol"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Symbol/)
  end
end
