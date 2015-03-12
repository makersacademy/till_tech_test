require './lib/tax'

describe Tax do

  it 'calculates a value after tax' do
    tax = Tax.new("10%")
    expect(tax.total(10.0)).to eq 9.0
  end

  it 'prints the tax rate and total of value' do
    tax = Tax.new("10%")
    expect(tax.print(50.0)).to eq({ total_after_tax: 45.0, tax: "10%" })
  end
end

