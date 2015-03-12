require './lib/tax'

describe Tax do

  it 'calculates value of tax' do
    tax = Tax.new("10%")
    expect(tax.total(10.0)).to eq 1.0
  end

  it 'prints the tax rate and total of value' do
    tax = Tax.new("10%")
    expect(tax.print(50.0)).to eq({ total: 5.0, tax: "10%" })
  end
end

