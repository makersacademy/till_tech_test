describe 'Till' do
  let(:till){Till.new}

  context 'starts with' do
    it 'a total of 0' do
      expect(till.total).to eq 0
    end
    it 'constant tax rate of 8.64%' do
      expect(till.TAX).to eq 0.864
    end
  end

  context 'product order' do
    it 'accepts orders for latte' do
      expect(till.order :latte).to eq 4.75
    end
    it 'accepts orders for americano' do
      expect(till.order :americano).to eq 3.75
    end
  end

  context 'calculates' do
    it 'the correct total for 2 lattes' do
      till.line_order :latte, 2
      expect(till.sale).to eq 9.50
    end
    it 'the tax at a rate of 8.64%' do
      till.line_order :latte, 2
      expect(till.tax).to eq 8.68
    end
  end
end