require 'till'

feature Till do
  let(:till) { Till.new }

    context 'Orders' do

    scenario 'Can create a new order' do
      expect(till).to respond_to(:newOrder)
    end

    scenario 'add 2 Choc Mudcakes to order' do
      till.newOrder
      till.addItem("Choc Mudcake", 2)
      expect(till.currentOrder.orderLines[0]).to eq ["Choc Mudcake", 2, 6.40]
    end
  end
end
