Given(/^I have ordered "(.*?)" "(.*?)"$/) do |num, item|
  order = num.to_i.times{Order.new(item.to_s)}.to_a
end

Given(/^I have ordered "(.*?)" "(.*?)" and "(.*?)" "(.*?)"$/) do |num1, item1, num2, item2|
  order = num1.to_i.times{Order.new(item1.to_s)}.to_a
  order << num2.to_i.times{Order.new(item2.to_s)}
end

When(/^I look at the receipt$/) do
  receipt = Receipt.new(order)
end

Then(/^I should see "(.*?)"$/) do |item|
  expect(receipt.print).to have_contents item
end
