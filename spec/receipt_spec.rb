require 'receipt'

describe Receipt do
  it 'is empty when created' do
    receipt = described_class.new
    expect(receipt.line_items.length).to eq 0
    expect(receipt.total).to eq ''
    expect(receipt.tax).to eq ''
  end

  it 'has line_items' do
    expect(subject).to respond_to :line_items
  end

  it 'has a tax amount' do
    expect(subject).to respond_to :tax
  end

  it 'has a total' do
    expect(subject).to respond_to :total
  end

  it 'responds to display method' do
    expect(subject).to respond_to :display
  end

  it 'can have a line item added' do
    subject.add_line('Tiramisu 1 x £11.40')
    expect(subject.display).to include 'Tiramisu 1 x £11.40'
  end

  it 'displays line_items' do
    receipt = described_class.new
    receipt.line_items = ['Tiramisu 2 x £11.40', 'Americano 4 x £3.75']
    expect(receipt.display).to include 'Americano 4 x £3.75'
  end

  it 'can have a total added' do
    subject.add_total(5.55)
    expect(subject.total).to eq '5.55'
    expect(subject.display).to include 'Total        £5.55'
  end

  it 'can have the tax added' do
    subject.add_tax(0.70)
    subject.add_line('Tiramisu 1 x £11.40')
    expect(subject.tax).to eq '0.70'
    expect(subject.display).to include 'Tax          £0.70'
  end

  it 'it can get header information from a JSON file' do
    subject.read_header('hipstercoffee.json')
    expect(subject.business).to eq 'The Coffee Connection'
    expect(subject.address).to eq '123 Lakeside Way'
    expect(subject.phone).to eq '16503600708'
  end

  it 'can provide a receipt with line_items, tax and total' do
    receipt = described_class.new
    receipt.read_header('hipstercoffee.json')
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
