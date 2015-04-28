require 'till'
require 'product'

feature 'As a barista to serve a customer I need to provide a receipt' do

  scenario 'Jane orders 2 Cafe Lattes and gets a receipt' do
    till = Till.new
    till.read_file('hipstercoffee.json')
    till.order('Cafe Latte')
    till.order('Cafe Latte')
    expect(till.line_items).to include 'Cafe Latte 2 x £4.75'
    expect(till.subtotal).to eq '£9.50'
  end

  scenario 'John orders 4 Americanos and gets a receipt' do
    till = Till.new
    till.read_file('hipstercoffee.json')
    4.times { till.order('Americano') }
    expect(till.subtotal).to eq '£15.00'
  end

  scenario 'John orders 4 Americanos and 2 Tiramisus and gets a receipt' do
    till = Till.new
    till.read_file('hipstercoffee.json')
    4.times { till.order 'Americano' }
    2.times { till.order 'Tiramisu' }
    expect(till.subtotal).to eq '£37.80'
  end
end
