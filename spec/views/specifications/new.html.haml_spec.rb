require 'spec_helper'

describe "specifications/new.html.haml" do
  before(:each) do
    assign(:specification, stub_model(Specification,
      :name => "MyString",
      :radix => 1,
      :variables => 1,
      :content => "MyText",
      :complete => "MyText"
    ).as_new_record)
  end

  it "renders new specification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => specifications_path, :method => "post" do
      assert_select "input#specification_name", :name => "specification[name]"
      assert_select "input#specification_radix", :name => "specification[radix]"
      assert_select "input#specification_variables", :name => "specification[variables]"
      assert_select "textarea#specification_content", :name => "specification[content]"
      assert_select "textarea#specification_complete", :name => "specification[complete]"
    end
  end
end
