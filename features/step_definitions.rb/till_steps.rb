Given (/^the customer wants a new order$/) do
  @till = Till.new
end

Given(/^I enter quantity (\d+) of "(.*?)" into the order$/) do |quantity, item|
  @till.add_order_item(item: item, quantity: quantity)
end

Then(/^the order should contain both (\d+) "(.*?)" and (\d+) "(.*?)"$/) do |qty1, item1, qty2, item2|
  @till.order.should == {item1=>qty1, item2=>qty2}
end

Then(/^the order should contain (\d+) "(.*?)"$/) do |quantity, item|
  @till.order.should == {item=>quantity}
end

Given(/^a customer has made their order$/) do
  @till = Till.new
  @till.add_order_item(item: "Cafe Latte", quantity: 2)
end

Given(/^I am ready to take the next customers order$/) do
  @till.reset_order
end

Then(/^the order should be empty$/) do
  @till.order.should be_empty
end
