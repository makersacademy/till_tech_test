require 'till'

describe Till do

  it 'loads the item list' do
    expect(subject.list_prices).not_to be_empty
  end

  it 'can add an item to an order' do
    subject.add(item: "Cafe Latte", quantity: 1)
    expect(subject.items).to eq [{item: "Cafe Latte", quantity: 1}]
  end

  it 'knows the price of an item' do
    subject.add(item: "Cafe Latte", quantity: 1)
    expect(subject.price_of('Cafe Latte')).to eq(4.75)
  end

  it 'can calculate the price of multiple orders' do
    subject.add(item: "Cafe Latte", quantity: 2)
    expect(subject.net_total).to eq(9.50)
  end

  it 'adds the correct rate of tax to an item' do
    subject.add(item: "Cafe Latte", quantity: 2)
    expect(subject.tax(9.50)).to eq(0.82)
  end

  it 'gives a full total of the net total and tax' do
    subject.add(item: "Cafe Latte", quantity: 2)
    expect(subject.full_total).to eq(10.32)
  end

end