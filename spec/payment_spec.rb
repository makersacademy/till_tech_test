require './lib/payment'

describe Payment do

  it 'outputs information about payment' do
    payment = Payment.new(30.0)
    expect(payment.print(35.0)).to eq({
      payment: 30.0,
      remaining_balance: 5.0,
      change: 0.0 })
  end
end

