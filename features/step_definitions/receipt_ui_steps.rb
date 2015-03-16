World(KnowsTheUserInterface)

Given(/^I am on the homepage$/) do
  visit '/'
end

Given(/^I choose an item from the menu$/) do
  page.first('.menu-items').click;
end

Then(/^it should appear in the OrderList$/) do
  sleep(1) # to give time to Ajax calls.
  expect(order_list.orders.count).to eq 1
end
