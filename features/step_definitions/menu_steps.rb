Given(/^I have ordered something on the menu$/) do
  self.order = menu.order(:spaghetti)
end

Then(/^my order should be placed$/) do
  expect(order.class).to eq Order
end

def menu
  @menu ||= Menu.new(spaghetti: {name: 'Spaghetti', price: 5.0 })
end

def order=(order_details)
  @order = Order.new(order_details)
end

def order
  @order
end

