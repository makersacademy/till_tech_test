require 'order'

describe Order do
  let(:order) { Order.new }

  it { is_expected.to respond_to :empty? }

  it { is_expected.to respond_to :items }

  it 'adds up to 0 when nothing is ordered' do
    expect(order.total).to eq 0
  end

  it 'can accept an order of cortado' do
    order.add :cortado
    expect(order.total).to eq 4.55
  end

  it 'can accept an order of cappucino' do
    order.add :cappucino
    expect(order.total).to eq 3.85
  end

  it 'can accept an order of 1 cappucino and 1 cortado' do
    order.add :cappucino
    order.add :cortado
    expect(order.total).to eq 8.40
  end


end