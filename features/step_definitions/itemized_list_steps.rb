require './lib/order'
require './lib/order_list'
require './lib/receipt'

Given(/^I order "(.*?)"$/) do |order|
  get_order_list.receive_order Order.new({name: order, price: 5.0})
end

Then(/^my receipt shows an itemized list of my order$/) do
  expect(get_receipt.print).to have_key :items 
end

def get_order_list
  @order_list ||= OrderList.new
end

def get_receipt
  @receipt    ||= Receipt.new(get_order_list)
end

