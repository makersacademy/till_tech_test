require 'till'
require 'product'

describe Till do
  before(:each) do
    subject.read_file('hipstercoffee.json')
  end

  it 'can read the product list from a JSON file' do
    expect(subject.price_list.length).to eq 15
  end

  it 'can find the cost of a named product' do
    expect(subject.cost('Affogato')).to eq 14.80
    expect(subject.cost('Cortado')).to eq 4.55
    expect(subject.cost('Choc Mousse')).to eq 8.20
  end

  describe 'can show' do
    # xit 'responds to display method' do
    #   expect(subject).to respond_to :display
    # end

    xit 'the correct line item for a product' do
      subject.order('Cafe Latte')
      expect(subject.line_items).to include 'Cafe Latte 1 x £4.75'
    end

    xit 'the correct line items for an order of several products' do
      till.read_file('hipstercoffee.json')
      2.times { subject.order('Tiramisu') }
      4.times { subject.order('Americano') }
      5.times { subject.order('Blueberry Muffin') }
      expect(subject.line_items).to include 'Tiramisu 2 x £11.40'
      expect(subject.line_items).to include 'Americano 4 x £3.75'
      expect(subject.line_items).to include 'Blueberry Muffin 5 x £4.05'
    end

    xit 'can provide a receipt with line_items, tax and total' do
      receipt = described_class.new
      subject.read_header('hipstercoffee.json')
      receipt.add_line('Tiramisu 1 x £11.40')
      receipt.add_line('Americano 4 x £3.75')
      receipt.add_tax(0.90)
      receipt.add_total(22.80)
      expect(receipt.business).to eq 'The Coffee Connection'
      expect(receipt.address).to eq '123 Lakeside Way'
      expect(receipt.phone).to eq '16503600708'
      expect(receipt.display).to include 'Tiramisu 1 x £11.40'
      expect(receipt.display).to include 'Americano 4 x £3.75'
      expect(receipt.display).to include 'Total        £22.80'
      expect(receipt.display).to include 'Tax          £0.90'
    end
  end

  describe 'can calculate' do
    it 'the correct total for 2 Cafe Lattes' do
      2.times { subject.order('Cafe Latte') }
      expect(subject.subtotal).to eq '£9.50'
    end

    it 'the correct total for for an order of several products' do
      4.times { subject.order('Americano') }
      2.times { subject.order('Tiramisu') }
      5.times { subject.order('Blueberry Muffin') }
      expect(subject.subtotal).to eq '£58.05'
    end

    it 'the correct tax for an order' do
      2.times { subject.order('Cafe Latte') }
      expect(subject.tax.round(2)).to eq 0.82
    end
  end
end
