require 'order'

describe Order do
  it 'will be empty when initialized' do
    expect(subject.complete_order).to eq []
  end
end
