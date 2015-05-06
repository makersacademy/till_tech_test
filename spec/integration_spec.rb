require 'till'
require 'product'
require 'receipt'

describe 'integrations' do
  # before(:each) do
  #   till = Till.new
  #   till.read_file('hipstercoffee.json')
  # end

  describe 'can provide' do
    it "the correct receipt for John's order" do
      till = Till.new
      till.read_file('hipstercoffee.json')
      receipt = Receipt.new
      2.times { till.order('Tiramisu') }
      4.times { till.order('Americano') }
      5.times { till.order('Blueberry Muffin') }
      till.complete_receipt(receipt)
      # puts receipt.display
      expect(receipt.display).to include 'Tiramisu 2 x £11.40'
      expect(receipt.display).to include 'Americano 4 x £3.75'
      expect(receipt.display).to include 'Blueberry Muffin 5 x £4.05'
      expect(receipt.display).to include 'Tax          £5.02'
      expect(receipt.display).to include 'Total        £63.07'
    end

    it "the correct receipt for Janes's order" do
      till = Till.new
      till.read_file('hipstercoffee.json')
      receipt = Receipt.new
      2.times { till.order('Cafe Latte') }
      1.times { till.order('Choc Mudcake') }
      1.times { till.order('Blueberry Muffin') }
      till.complete_receipt(receipt)
      expect(receipt.display).to include 'Cafe Latte 2 x £4.75'
      expect(receipt.display).to include 'Choc Mudcake 1 x £6.40'
      expect(receipt.display).to include 'Blueberry Muffin 1 x £4.05'
      expect(receipt.display).to include 'Tax          £1.72'
      expect(receipt.display).to include 'Total        £21.67'
    end
  end
end
