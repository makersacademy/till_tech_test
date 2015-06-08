require 'capybara/rspec'

feature 'the order is correctly repeated to the customer' do
  scenario 'with nothing ordered' do
    order = Order.new
    printed_order = OrderPrinter.print order
    expect(printed_order).to eq "Nothing ordered yet"
  end

  scenario 'with a cappucino' do
    order = Order.new
    order.add :cappucino
    printed_order = OrderPrinter.print order
    expect(printed_order).to eq "1 x cappucino"
  end
end