require 'receipt'

describe 'Receipt' do

  let(:janes_receipt){Receipt.new}

  it 'will contain a header with the shop name, address and phone number' do
    expect(janes_receipt.header).to include(shopName: "The Coffee Connection",
    address: "123 Lakeside Way", phone: "16503600708")
  end

  it 'will contain an order total section displaying the total tax and total incl tax' do
    expect(janes_receipt.order_total(9.5, 2.5)).to include(tax: 2.50, total: 9.50)
  end

  it 'will contain a line for each product and quantity ordered' do

  end

end