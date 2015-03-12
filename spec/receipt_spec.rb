require './lib/receipt'
require './lib/order_list'

describe Receipt do

  let(:order_list) { double('OrderList', total: 10.0, print: { itemized_list: [], 
                                                               items_total: 10.0 })}
  let(:tax)        { double('Tax'      , print: { after_tax: 9.5 }) } 

  let(:receipt) do 
    Receipt.new(order_list, tax: tax)
  end
  
  describe 'runs calculations passed on initialization' do

    it 'and outputs them as a hash' do
      expect(receipt.print).to eq ({itemized_list: [], items_total: 10.0, after_tax: 9.5}) 
    end
  end
end

