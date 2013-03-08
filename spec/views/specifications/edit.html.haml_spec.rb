require 'spec_helper'

describe "specifications/edit.html.haml" do
  before(:each) do
    @specification = assign(:specification, stub_model(Specification,
      :name => "MyString",
      :radix => 1,
      :variables => 1,
      :content => "MyText",
      :complete => "MyText"
    ))
  end

  it "renders the edit specification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => specifications_path(@specification), :method => "post" do
      assert_select "input#specification_name", :name => "specification[name]"
      assert_select "input#specification_radix", :name => "specification[radix]"
      assert_select "input#specification_variables", :name => "specification[variables]"
      assert_select "textarea#specification_content", :name => "specification[content]"
      assert_select "textarea#specification_complete", :name => "specification[complete]"
    end
  end
end
