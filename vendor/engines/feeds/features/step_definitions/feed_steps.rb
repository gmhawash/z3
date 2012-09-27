Given /^I have no feeds$/ do
  Feed.delete_all
end

Given /^I (only )?have feeds titled "?([^\"]*)"?$/ do |only, titles|
  Feed.delete_all if only
  titles.split(', ').each do |title|
    Feed.create(:name => title)
  end
end

Then /^I should have ([0-9]+) feeds?$/ do |count|
  Feed.count.should == count.to_i
end
