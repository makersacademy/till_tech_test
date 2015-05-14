require_relative '../app/lib/payment'

describe Payment do
  context 'Calculating the correct amount of change' do

    let(:payment){Payment.new}
    
    it 'Given an amount tendered and a total due' do
      expect(payment.calculate_change(17.28, 20)).to eq 2.72
    end
  end
end