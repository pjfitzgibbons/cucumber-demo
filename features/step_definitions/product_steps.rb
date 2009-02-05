Given /I am on the new product page/ do
  visit "/products/new"
end

#Given /^the following products:$/ do |products|
#  Product.create!(products.hashes)
#end

When /^I delete the (\d+)(?:st|nd|rd|th) product$/ do |pos|
  visit products_path
  click_link_within("table > tbody > tr:nth-child(#{pos.to_i+1})", "Destroy")
end

Then /^I should see the following products:$/ do |products|
  products.raw[1..-1].each_with_index do |row, i|
    row.each_with_index do |cell, j|
      response.should have_selector("table > tbody > tr:nth-child(#{i+2}) > td:nth-child(#{j+1})") { |td|
        td.inner_text.should == cell
      }
    end
  end
end
