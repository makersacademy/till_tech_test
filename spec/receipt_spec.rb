require 'receipt'

describe Receipt do
  it 'is empty when created' do
    receipt = described_class.new
    expect(receipt.business).to eq ''
    expect(receipt.address).to eq ''
    expect(receipt.phone).to eq ''
    expect(receipt.items).to eq []
    expect(receipt.total).to eq 0
    expect(receipt.tax).to eq 0
  end

  it 'can have a business name' do
    subject.add_business('The Cafe')
    expect(subject.business).to eq 'The Cafe'
  end

  it 'can have an adress' do
    subject.add_address('London Road')
    expect(subject.address).to eq 'London Road'
  end

  it 'can have a phone number' do
    subject.add_phone('123456789')
    expect(subject.phone).to eq '123456789'
  end

  it 'has items' do
    subject.add_item(:Tea, 3)
    expect(subject.items.length).to eq 3
  end

  it 'has a tax amount' do
    subject.add_tax(10)
    expect(subject.tax).to eq 10
  end

  it 'has a total' do
    subject.add_total(35)
    expect(subject.total).to eq(35)
  end

end
