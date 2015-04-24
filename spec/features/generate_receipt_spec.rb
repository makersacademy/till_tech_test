require 'till'
feature 'As a barista to serve a customer I need to provide a receipt' do

  scenario 'Jane orders 2 Cafe Lattes and gets a receipt' do
    till = Till.new
    till.order :latte
    till.order :latte
    expect(till.line_items).to include '2 x Caffe Latte'
    expect(till.checkout).to eq '9.50'
  end

  scenario 'John orders 4 Americanos and gets a receipt' do
    till = Till.new
    4.times { till.order :americano }
    expect(till.checkout).to eq '15.00'
  end
end
