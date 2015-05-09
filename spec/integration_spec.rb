require 'till'
require 'product'
require 'receipt'

describe 'integration tests' do

  describe 'till can' do
    before(:each) do
      till = Till.new
      till.read_product_list('hipstercoffee.json')
    end
    it 'add information to a receipt' do
      till = Till.new
      till.read_product_list('hipstercoffee.json')
      till.read_header('hipstercoffee.json')
      till.order('Cafe Latte')
      till.order('Cortado')
      receipt = Receipt.new
      receipt.add_header(till.business, till.address, till.phone)
      receipt.add_items(till.order_items)
      receipt.add_total(10)
      receipt.add_tax(1)
      expect(receipt.business).to eq 'The Coffee Connection'
      expect(receipt.address).to eq '123 Lakeside Way'
      expect(receipt.phone).to eq '16503600708'
      expect(receipt.items).to include 'Cafe Latte'
      expect(receipt.items).to include 'Cortado'
      expect(receipt.total).to eq 10
      expect(receipt.tax).to eq 1
    end

    it 'add items to a receipt' do
      till = Till.new
      till.read_header('hipstercoffee.json')
      till.read_product_list('hipstercoffee.json')
      receipt = Receipt.new
      till.order('Cafe Latte')
      4.times { till.order('Cortado') }
      till.complete_receipt(receipt)
      expect(receipt.business).to eq 'The Coffee Connection'
      expect(receipt.address).to eq '123 Lakeside Way'
      expect(receipt.phone).to eq '16503600708'
      expect(receipt.items).to include 'Cafe Latte'
      expect(receipt.items).to include 'Cortado'
      expect(receipt.total.round(2)).to eq 24.93
      expect(receipt.tax.round(2)).to eq 1.98
    end

    it " show the correct receipt for John's order" do
      till = Till.new
      till.read_header('hipstercoffee.json')
      till.read_product_list('hipstercoffee.json')
      receipt = Receipt.new
      2.times { till.order('Tiramisu') }
      4.times { till.order('Americano') }
      5.times { till.order('Blueberry Muffin') }
      till.complete_receipt(receipt)
      output = till.display_receipt(receipt)
      # puts output
      expect(output).to include 'Tiramisu 2 x £11.40'
      expect(output).to include 'Americano 4 x £3.75'
      expect(output).to include 'Blueberry Muffin 5 x £4.05'
      expect(output).to include 'Tax £5.02'
      expect(output).to include 'Total £63.07'
    end

    it "show the correct receipt for Janes's order" do
      till = Till.new
      till.read_header('hipstercoffee.json')
      till.read_product_list('hipstercoffee.json')
      receipt = Receipt.new
      2.times { till.order('Cafe Latte') }
      1.times { till.order('Choc Mudcake') }
      1.times { till.order('Blueberry Muffin') }
      till.complete_receipt(receipt)
      output = till.display_receipt(receipt)
      # puts output
      expect(output).to include 'Cafe Latte 2 x £4.75'
      expect(output).to include 'Choc Mudcake 1 x £6.40'
      expect(output).to include 'Blueberry Muffin 1 x £4.05'
      expect(output).to include 'Tax £1.72'
      expect(output).to include 'Total £21.67'
    end
  end
end
