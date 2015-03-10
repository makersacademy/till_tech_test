@example = JSON.parse(File.read('./features/support/shop_examples.json'))

Given(/^I am at "(.*?)"$/) do |arg1|
  @till = Till.new(@example)
end

Given(/^I have ordered "(\d*?)" "(.*?)"$/) do |quantity, item|
  order = Order.new(item)

  quantity.to_i.times do
    @till.receive_order(order)
  end
end

Then(/^I should have "(.*?)" on my receipt$/) do |arg1|
  expect(@till.receipt.print).to eq(
    "items: 
      2 x  Caffe Latte, 4.75
    ")
end

