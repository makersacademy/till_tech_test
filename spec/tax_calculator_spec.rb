require 'tax_calculator'

describe TaxCalculator do
  it 'responds to calculate_tax class method' do
    expect(described_class).to respond_to(:calculate_tax).with(1).argument
  end

  it 'returns tax of 0 when order is empty' do
    order = double(:order, empty?: true, items: {})
    expect(described_class.calculate_tax order).to eq 0
  end

  it 'returns tax of 0.33 when order consists of a cappucino' do
    order = double(:order, items: {cappucino: 1})
    expect(described_class.calculate_tax order).to eq 0.33
  end
end