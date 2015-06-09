require 'capybara/rspec'

feature 'order is taken correctly' do
  scenario 'when nothing is ordered' do
    order = Order.new
    expect(order.items).to be_empty
  end

  scenario 'when 1 cortado is ordered' do
    order = Order.new
    order.add :cortado
    expect(order.items).to include({cortado: 1})
  end

  scenario 'when 2 cortados are ordered' do
    order = Order.new
    order.add :cortado, 2
    expect(order.items).to include({cortado: 2})
  end

  scenario 'when 2 cortados and 2 cappucinos are ordered' do
    order = Order.new
    order.add :cortado, 2, :cappucino, 2 
    expect(order.items).to include({cortado: 2, cappucino: 2})
  end

  scenario 'when a cortado and 2 cappucinos are ordered' do
    order = Order.new
    order.add :cortado, :cappucino, 2 
    expect(order.items).to include({cortado: 1, cappucino: 2})
  end
end