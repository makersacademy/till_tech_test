require 'order'

describe Order do
  let(:order) { Order.new }

  it { is_expected.to respond_to :empty? }

  it { is_expected.to respond_to :items }

  it 'is empty when nothing is ordered' do
    expect(order.items).to be_empty
  end

  it 'can accept an order of cortado' do
    order.add :cortado
    expect(order.items).to include({cortado: 1})
  end

  it 'can accept an order of cappucino' do
    order.add :cappucino
    expect(order.items).to include({cappucino: 1})
  end

  it 'can accept an order of 2 cortados at the same time' do
    order.add :cortado, 2
    expect(order.items).to include({cortado: 2})
  end

  it 'can accept an order of 2 cortados and 2 cappucinos at the same time' do
    order.add :cortado, 2, :cappucino, 2
    expect(order.items).to include({cortado: 2, cappucino: 2})
  end

  it 'can accept an order of 1 cappucino and 1 cortado' do
    order.add :cappucino
    order.add :cortado
    expect(order.items).to include({cortado: 1, cappucino: 1})
  end


end