describe 'Till' do
  let(:till){Till.new}

  context 'created with' do
    it 'a total of 0' do
      expect(till.total).to eq 0
    end

    it 'a tax total of 0' do
      expect(till.tax_total).to eq 0
    end

    it 'an emptly list of orders' do
      expect(till.ordered_items.empty?).to be true
    end

    it 'a tax rate of 8.64%' do
      expect(Till::TAX).to eq 0.0864
    end
  end

  context 'product price' do
    it 'is found for a latte' do
      expect(till.product_price 'Cafe Latte').to eq 4.75
    end

    it 'is found for an americano' do
      expect(till.product_price 'Americano').to eq 3.75
    end
  end

  context 'calculates pre tax sale' do
    it 'for 2 lattes of 9.50' do
      till.line_order 'Cafe Latte', 2
      till.pre_tax_total
      expect(till.total).to eq 9.50
    end
  end

   context 'calculates tax' do
    it 'for a sale of 9.50 at tax rate of 8.64% giving a tax amount of 0.8208' do
      till.calculate_tax(9.50)
      expect(till.tax_total).to eq 0.82
    end
  end

  context 'total sale amount' do
    it 'inclusive of tax for a Cafe Latte order is calculated.' do
      till.line_order 'Cafe Latte', 1
      expect(till.sale).to eq 5.16
    end
  end

end