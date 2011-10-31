require 'spec_helper'

describe "gates/edit.html.haml" do
  before(:each) do
    @gate = assign(:gate, stub_model(Gate,
      :name => "MyString",
      :image => "",
      :symbol => "MyString"
    ))
  end

  it "renders the edit gate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gates_path(@gate), :method => "post" do
      assert_select "input#gate_name", :name => "gate[name]"
      assert_select "input#gate_image", :name => "gate[image]"
      assert_select "input#gate_symbol", :name => "gate[symbol]"
    end
  end
end
