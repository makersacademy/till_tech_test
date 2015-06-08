require 'capybara/rspec'

feature 'calculating total' do
  let(:order) { Order.new }
  
  scenario 'when customer orders nothing' do
    expect(order.total).to eq 0
  end

  scenario 'when customer orders a cortado' do
    order.add :cortado
    expect(order.total).to eq 4.55
  end

  scenario 'when customer orders a cappucino' do
    order.add :cappucino
    expect(order.total).to eq 3.85
  end

  scenario 'when customer orders a cappucino and a cortado' do
    order.add :cappucino
    order.add :cortado
    expect(order.total).to eq 8.40
  end  
end