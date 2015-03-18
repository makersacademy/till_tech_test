Given(/^I have ordered something on the menu$/) do
  self.order = menu.order('Spaghetti')
end

Then(/^my order should be placed$/) do
  expect(order.class).to eq Order
end

