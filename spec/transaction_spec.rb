describe Transaction do

  let(:transaction) {Transaction.new}

  it 'Has a subtotal' do
    expect(transaction.subtotal).to eq 0
  end

end