require 'spec_helper'

describe Circuit do
  describe "#parsed_content" do
    it "should raise SyntaxError if term has invalid data" do
      circuit = Circuit.new
      circuit.stub!(:content).and_return('111201 100')

      expect {circuit.parsed_content}.to raise_error SyntaxError
    end
  end

  describe "#gates" do
    it "should return nul if parsed content corrupt" do
      circuit = Circuit.new
      circuit.stub!(:parsed_content)
      circuit.gates.should  be_nil
    end

    it "should return array of terms for valid data" do
      circuit = Circuit.new
      circuit.stub!(:parsed_content).and_return( '100+10 111+11')
      circuit.gates.should == %w(100+10 111+11)
    end

    it "should raise SyntaxError if term has mismatch of term sizes" do
      circuit = Circuit.new
      circuit.stub!(:parsed_content).and_return('111101 100')

      expect {circuit.gates}.to raise_error SyntaxError
    end

  end

  describe "#content=" do
    it "should read content of file and save it in binary blob" do

    end

    it "should skip invalid value" do

    end

    it "should ensure that file stream is open" do

    end
  end

  describe "#each_gate" do

  end

  describe "#strip_comments" do
    it "should strip entire line starting with comment delimeter" do
      content = <<-LINES
         # This is  a test of line 1
         All is good here
         All is well here too
         # This is another pesky comment line
         #
      LINES

      expected = "All is good here All is well here too"

      Circuit.new.strip_comments(content).should == expected.strip
    end

    it "should strip end of line starting from comment delimeter" do
      content = <<-LINES
         All is good here   # Well here
         All is well here too
      LINES

      expected = "All is good here All is well here too"

      Circuit.new.strip_comments(content).should == expected.strip
    end
  end
end
