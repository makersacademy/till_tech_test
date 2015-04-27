require 'till'

describe Till do

  it 'can add an item to an order' do
    subject.add(:latte)
    expect(subject.items).to eq [:latte]
  end

end