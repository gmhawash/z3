require 'spec_helper'

describe "gates/new.html.haml" do
  before(:each) do
    assign(:gate, stub_model(Gate,
      :name => "MyString",
      :image => "",
      :symbol => "MyString"
    ).as_new_record)
  end

  it "renders new gate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gates_path, :method => "post" do
      assert_select "input#gate_name", :name => "gate[name]"
      assert_select "input#gate_image", :name => "gate[image]"
      assert_select "input#gate_symbol", :name => "gate[symbol]"
    end
  end
end
