require 'till'

feature Till do
  let(:till) { Till.new }

  context 'Orders' do

    scenario 'Can create a new order' do
      expect(till).to respond_to(:newOrder)
    end

    scenario 'add 2 Choc Mudcakes to order' do
      till.addItem("Choc Mudcake", 2)
      expect(till.currentOrder.lines[0]).to eq ["Choc Mudcake", 2, 6.40]
    end

    scenario 'calculates correct total without tax' do
      till.addItem("Choc Mudcake", 2)
      till.addItem("Blueberry Muffin", 1)
      expect(till.currentOrder.totalNoTax).to eq 16.85
    end

    scenario 'calculate correct amount with tax' do
      till.addItem("Choc Mudcake", 2)
      till.addItem("Blueberry Muffin", 1)
      expect(till.currentOrder.totalWithTax).to eq 18.31
    end

    scenario 'finishes an order and prints total' do
      till.addItem("Choc Mudcake", 2)
      till.addItem("Blueberry Muffin", 1)
      till.finishOrder
      expect(till.orders.count).to eq 1
      expect(till.orders[0].lines.count).to eq 2
      expect(till.orders[0].total).to eq 18.31
    end

  end
end
