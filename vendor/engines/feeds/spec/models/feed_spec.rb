require 'spec_helper'

describe Feed do

  def reset_feed(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @feed.destroy! if @feed
    @feed = Feed.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_feed
  end

  context "validations" do
    
    it "rejects empty name" do
      Feed.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_feed
      Feed.new(@valid_attributes).should_not be_valid
    end
    
  end

end