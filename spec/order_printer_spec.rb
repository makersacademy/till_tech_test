require 'order_printer'

describe OrderPrinter do
  it 'responds to repeat class method with 1 argument' do
    expect(described_class).to respond_to(:print).with(1).argument
  end

  it 'says that nothing has been ordered yet when that is the case' do
    order = double(:order, items: {}, empty?: true)
    expect(described_class.print order).to eq "Nothing ordered yet"
  end

  it 'says that 1 cappucino was ordered' do
    order = double(:order, items: {cappucino: 1}, empty?: false)
    expect(described_class.print order).to eq "1 x cappucino"
  end
end
