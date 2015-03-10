Given(/^I am at "(.*?)"$/) do |arg1|
  till = Till.new(@examples.sample)
end

Given(/^I have ordered "(\d*?)" "(.*?)"$/) do |quantity, item|
  quantity.to_i.times do
    till.receive_order(item)
  end
end

Then(/^I should have "(.*?)" on my receipt$/) do |arg1|
  expect(till.print_receipt).to eq({ items: [
    [2, "Caffe Latte", 4.75]
  ]})
end
