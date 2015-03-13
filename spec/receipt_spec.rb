require './lib/receipt'
require './lib/order_list'

describe Receipt do

  let(:order_list) { double('OrderList', total: 10.0, print: {items: 
                            { list: [], total: 10.5 }})}
  let(:tax)        { double('Tax'      , print: { after_tax: 10.5, total: 0.5 }) } 

  let(:receipt) do 
    Receipt.new(order_list, tax: tax)
  end
  
  it 'prints information provided by objects passed on initialization' do
    expect(receipt.run_and_print_calculations).to eq(tax: { after_tax: 10.5, total: 0.5 }) 
  end

  it 'appends a total to the printed receipt-hash' do
    expect(receipt.print[:total]).to eq 11.0
  end
end

