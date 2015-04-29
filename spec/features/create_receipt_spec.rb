feature 'As a customer I want to be able to order items from a coffee shop' do

  let(:till) { Till.new }
  let(:latte) { double :item, name: 'latte', price: 4.75 }
  let(:americano) { double :item, name: 'amercano', price: 3.75 }
  let(:muffin) { double :item, name: 'muffin', price: 4.05 }

  scenario 'Jane orders 2 cafe lattes' do
    till.order latte
    till.order latte
    expect(till.cash_out).to eq 9.50
  end

  scenario 'John orders 4 Americanos' do
    4.times { till.order americano }
    expect(till.cash_out).to eq 15.00
  end

  scenario 'Jane orders 2 cafe lattes and a blueberry muffin' do
    2.times { till.order latte }
    till.order muffin
    expect(till.cash_out).to eq 13.55
  end

end
