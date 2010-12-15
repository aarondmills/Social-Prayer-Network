Given /^the following prayers:$/ do |prayers|
  Prayer.create!(prayers.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) prayer$/ do |pos|
  visit prayers_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following prayers:$/ do |expected_prayers_table|
  expected_prayers_table.diff!(tableish('table tr', 'td,th'))
end
