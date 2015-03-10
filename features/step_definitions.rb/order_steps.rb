Given (/^the customer wants a new order$/) do
  @order = Order.new
end

Given(/^I enter quantity (\d+) of "(.*?)" into the order$/) do |quantity, item|
  @order.add_item(item, quantity)
end

Then(/^the order should contain (\d+) "(.*?)"$/) do |quantity, item|
  @order.items.should == {item=>quantity}
end
