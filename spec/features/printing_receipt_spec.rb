require 'capybara/rspec'

feature 'receipt is printed as expected' do
  scenario 'even in the funny case when the order is empty' do
    order = Order.new
    expect(ReceiptPrinter.print order).to eq "This is an eerily empty receipt. Order something next time, please!"
  end

  scenario 'when a cappucino was ordered' do
    order = Order.new
    order.add :cappucino
    expect(ReceiptPrinter.print order).to eq "Cappucino 1 x 3.85\nTax $0.33\nTotal $3.85"
  end
end