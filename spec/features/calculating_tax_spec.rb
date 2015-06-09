require 'capybara/rspec'

feature 'tax is calculated correctly' do
  scenario 'when order is empty' do
    order = Order.new
    tax = TaxCalculator.calculate_tax order
    expect(tax).to eq 0
  end

  scenario 'when order is 1 cappucino' do
    order = Order.new
    order.add :cappucino
    tax = TaxCalculator.calculate_tax order
    expect(tax).to eq 0.33
  end
end