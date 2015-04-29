require 'till'

describe Till do

  let(:latte) { double :item, name: 'latte', price: 4.75 }

  it 'responds to the method order' do
    expect(subject).to respond_to (:order)
  end

  it 'can receive an order for a latte' do
    expect(subject.order(latte)).to eq [latte]
  end

  it 'responds to the method cash_out' do
    expect(subject).to respond_to (:cash_out)
  end

  it 'returns the total' do
    2.times { subject.order latte }
    expect(subject.cash_out).to eq 9.50
  end
end