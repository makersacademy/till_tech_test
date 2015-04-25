require 'till'
require 'product'
feature 'As a barista to serve a customer I need to provide a receipt' do

  scenario 'Jane orders 2 Cafe Lattes and gets a receipt' do
    till = Till.new
    latte = Product.new('Caffe Latte', 4.75)
    till.order(latte)
    till.order(latte)
    expect(till.line_items).to include 'Caffe Latte 2 x 4.75'
    expect(till.checkout).to eq 9.50
  end

  scenario 'John orders 4 Americanos and gets a receipt' do
    till = Till.new
    americano = Product.new('Americano', 3.75)
    4.times { till.order(americano) }
    expect(till.checkout).to eq 15.00
  end

  scenario 'John orders 4 Americanos and 2 Tiramisus' do
    till = Till.new
    americano = Product.new('Americano', 3.75)
    tiramisu = Product.new('Tiramisu', 11.40)
    4.times { till.order americano }
    2.times { till.order tiramisu }
    expect(till.checkout).to eq 37.80
  end
end
