require 'receipt'

describe Receipt do
  it 'is empty when created' do
    receipt = described_class.new
    expect(receipt.lines.length).to eq 0
    expect(receipt.total).to eq 0
  end
end
