require 'capybara/rspec'

feature 'total is calculated correctly' do
  let(:order) { Order.new }
  
  scenario 'when customer orders nothing' do
    expect(TotalCalculator.calculate_total order).to eq 0
  end

  scenario 'when customer orders a cortado' do
    order.add :cortado
    expect(TotalCalculator.calculate_total order).to eq 4.55
  end

  scenario 'when customer orders a cappucino' do
    order.add :cappucino
    expect(TotalCalculator.calculate_total order).to eq 3.85
  end

  scenario 'when customer orders a cappucino and a cortado' do
    order.add :cappucino
    order.add :cortado
    expect(TotalCalculator.calculate_total order).to eq 8.40
  end  
end