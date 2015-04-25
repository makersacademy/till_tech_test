describe Till do

  let(:till) { Till.new }

  it 'responds to the order method' do
    expect(till).to respond_to :order
  end

  it 'can receive an order for a latte' do
    expect(till.order :latte).to eq '4.75'
  end

end