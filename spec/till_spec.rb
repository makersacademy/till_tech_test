require 'till'

describe Till do

  let(:till) {Till.new}

  it 'Can open a new transaction' do
    expect(till.transaction.subtotal).to eq 0;
  end
end