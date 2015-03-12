require 'payment'

describe 'taking payment' do

  let(:payment) {Payment.new}

  it 'should calculate the correct change based on a payment amount' do
    expect(payment.calculate_change(25, 21.67)).to eq(3.33)
  end

  it 'should provide a message saying how much change to give' do
    expect(payment.payment_result(25, 21.67)).to eq('Change - 3.33')
  end

  it 'should provide a message saying how much extra is due if tendered below total' do
    expect(payment.payment_result(20, 21.67)).to eq('Amount tendered is 1.67 less than amount due')
  end

end
