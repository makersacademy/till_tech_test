require 'till'

feature Till do
  let(:till) { Till.new }

  context 'Orders' do
    scenario 'Can create a new order' do
      expect(till).to respond_to(:new_order)
    end

    scenario 'add 2 Choc Mudcakes to order' do
      till.add_item('Choc Mudcake', 2)
      expect(till.current_order.lines[0]).to eq ['Choc Mudcake', 2, 6.40]
    end

    scenario 'calculates correct total without tax' do
      till.add_item('Choc Mudcake', 2)
      till.add_item('Blueberry Muffin', 1)
      expect(till.current_order.total_no_tax).to eq 16.85
    end

    scenario 'calculate correct amount with tax' do
      till.add_item('Choc Mudcake', 2)
      till.add_item('Blueberry Muffin', 1)
      expect(till.current_order.total_with_tax).to eq 18.31
    end

    scenario 'finishes an order and prints total' do
      till.add_item('Choc Mudcake', 2)
      till.add_item('Blueberry Muffin', 1)
      till.finish_order
      # expect(STDOUT).to receive(:puts).with('Choc Mudcake')
      expect(till.orders.count).to eq 1
      expect(till.orders[0].lines.count).to eq 2
      expect(till.orders[0].total).to eq 18.31
    end
  end
end
