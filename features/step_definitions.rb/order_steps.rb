Given (/^the customer wants a new order$/) do
  order = Order.new
end

Given (/^I enter quantity (\d+) of "(.*?)"$/) do |quantity, item|
  order.add_item(item, quantity)
end

Then(/^the order should contain (\d+) "(.*?)"$/) do |quantity, item|
  pending
end
