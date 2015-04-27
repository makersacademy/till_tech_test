describe 'Till' do
  let(:till){Till.new}

  context 'starts with' do
    it 'a total of 0' do
      expect(till.total).to eq 0
    end

    it 'a tax rate of 8.64%' do
      expect(Till::TAX).to eq 0.0864
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

  context 'calculates pre tax sale' do
    it 'for 2 lattes of 9.50' do
      expect(till.line_order :latte, 2).to eq 9.50
    end
  end

   context 'calculates tax' do
    it 'for a sale of 9.50 at tax rate of 8.64% giving a tax amount of 0.8208' do
      expect(till.calculate_tax(9.50)).to eq 0.82
    end
  end

end