require 'till'

describe Till do

  it 'loads the item list' do
    expect(subject.list_prices).not_to be_empty
  end

  it 'can add an item to an order' do
    subject.add(:latte)
    expect(subject.items).to eq [{:item=>:latte, :quantity=>1}]
  end

  it 'knows the price of an item' do
    subject.add(:latte)
    expect(subject.individual_price('Cafe Latte')).to eq(4.75)
  end

end