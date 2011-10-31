require 'spec_helper'

describe "circuits/new.html.haml" do
  before(:each) do
    assign(:circuit, stub_model(Circuit,
      :title => "MyString",
      :content => ""
    ).as_new_record)
  end

  it "renders new circuit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => circuits_path, :method => "post" do
      assert_select "input#circuit_title", :name => "circuit[title]"
      assert_select "textarea#circuit_content", :name => "circuit[content]"
    end
  end
end
