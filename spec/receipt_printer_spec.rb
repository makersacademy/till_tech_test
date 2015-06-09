require 'receipt_printer'

describe ReceiptPrinter do
  it 'is expected to respond to class method :print' do
    expect(described_class).to respond_to(:print).with(1).argument
  end

  it 'prints the silly warning when order is empty' do
    order = double(:order, empty?: true, items: {})
    expect(described_class.print order).to eq "This is an eerily empty receipt. Order something next time, please!"
  end
end