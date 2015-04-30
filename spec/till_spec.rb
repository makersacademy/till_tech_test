require 'till'

describe Till do
  let(:latte) { double :item, name: 'latte', price: 4.75 }
  let(:americano) { double :item, name: 'amercano', price: 3.75 }
  let(:muffin) { double :item, name: 'muffin', price: 4.05 }

  it 'responds to the method order' do
    expect(subject).to respond_to :order
  end

  it 'can receive an order for a latte' do
    expect(subject.order(latte)).to eq [latte]
  end

  it 'responds to the method cash_out' do
    expect(subject).to respond_to :cash_out
  end

  it 'returns the total' do
    2.times { subject.order latte }
    expect(subject.cash_out).to eq 9.50
  end

  it 'returns the item total' do
    3.times { subject.order latte }
    expect(subject.item_total(latte)).to eq 14.25
  end

  it 'calculates the tax due' do
    3.times { subject.order latte }
    subject.order americano
    2.times { subject.order muffin }
    expect(subject.tax).to eq 2.26
  end

end
