require 'total_calculator'

describe TotalCalculator do
  it 'returns 0 when order is empty' do
    order = double(:order, empty?: true, items: {})
    expect(described_class.calculate_total order).to eq 0
  end

  it 'returns 4.55 when a cortado is ordered' do
    order = double(:order, empty?: false, items: {cortado: 1})
    expect(described_class.calculate_total order).to eq 4.55
  end

  it 'returns 16.80 when 2 cortados and 2 cappucinos are ordered' do
    order = double(:order, empty?: false, items: {cortado: 2, cappucino: 2})
    expect(described_class.calculate_total order).to eq 16.80
  end
end