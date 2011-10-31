require 'spec_helper'

describe "circuits/show.html.haml" do
  before(:each) do
    @circuit = assign(:circuit, stub_model(Circuit,
      :title => "Title",
      :content => "10+1"
    ))
    @gates = assign(:gates, @circuit.gates)
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
