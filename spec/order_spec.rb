require 'order'

describe Order do
  let(:order) { Order.new }
  line = ["Cake", 2, 4.5]

  it 'adds a line' do
    expect { order.add(line) }.to change { order.lines.count }.by(1)
  end

  it 'calculates correct amount without tax' do
    3.times { order.add(line) }
    expect(order.total_no_tax).to eq 27
  end

  it 'calculates correct amount with tax' do
    order.add(line)
    expect(order.total_with_tax).to eq 9.78
  end

  it 'finishes order and saves total' do
    order.add(line)
    order.finish
    expect(order.total).to eq 9.78
  end
end
