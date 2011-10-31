require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the CircuitsHelper. For example:
#
# describe CircuitsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe CircuitsHelper do
  context "render_term" do
    it "should handle strings correclty" do
      render_term("0+0").should == [EMPTY, NOT, EMPTY]
      render_term("1+0").should == [CTRL_BOTTOM, NOT_TOP, EMPTY]
      render_term("1+1").should == [CTRL_BOTTOM, NOT_BOTH, CTRL_TOP]
      render_term("00101+010").should == [EMPTY, EMPTY, CTRL_BOTTOM, WIRE, CTRL_BOTH, NOT_BOTH, WIRE, CTRL_TOP, EMPTY]
    end
  end

  context "#render_term" do
    it "should work" do
      render_term(0b010, 3, 0b000).should == [EMPTY, NOT, EMPTY]
      render_term(0b010, 3, 0b100).should == [CTRL_BOTTOM, NOT_TOP, EMPTY]
      render_term(0b010, 2, 0b101 ).should == [CTRL_BOTTOM, NOT_BOTH, CTRL_TOP]
      render_term(0b000001000,
                  9,
                  0b001010010
                  ).should == [EMPTY, EMPTY, CTRL_BOTTOM, WIRE, CTRL_BOTH, NOT_BOTH, WIRE, CTRL_TOP, EMPTY]
    end
  end

  context "#target_position" do
    it "should return position of target bit" do
        target_position(0b10000).should == 4
        target_position(0b0000100000000).should == 8
        target_position(0b10000000000000000000000000000000).should == 31
        target_position(2**42).should == 42
        target_position(0b1).should == 0
    end

    it "should raise error when no target bit set" do
      lambda {target_position(0)}.should raise_error ArgumentError
    end

    it "should raise error when more than one target bit set" do
      expect {target_position(0b0110)}.to raise_error ArgumentError
      expect {target_position(0b0110)}.to raise_error ArgumentError
      expect {target_position(0b00011)}.to raise_error ArgumentError
    end
  end

  context "#bit_array" do
    it "should return array of bit masks for corrosponding index" do
      bit_array.should == [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768]
      bit_array.size.should == 16
    end
  end

  context "#bounding_controls" do
    it "should return the position of the most left and most right control bit" do
      bounding_controls(0b00100, 3).should == [3,2]
      bounding_controls(0b00101, 2).should == [2,0]
      bounding_controls(0b01110101, 3).should == [6,0]
      bounding_controls(0b1110101, 2).should == [6,0]
      bounding_controls(0b11101010000, 1).should == [10,1]
    end

    it "should return nil for no controls" do
      bounding_controls(0, 1).should == [0,0]
    end
  end
end
