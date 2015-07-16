require 'till'

describe Till do
    let(:till) { Till.new }

    it 'loads Shop Name' do
      expect(till.shopName).to eq 'The Coffee Connection'
    end

    it 'loads Tiramisu & price' do
      expect(till.prices["Tiramisu"]).to eq 11.40
    end

    it 'shows a list of prices' do
      expect(till.prices.count).to eq 15
    end

    it 'prints a list of prices' do
      expect(STDOUT).to receive(:puts).with('Flat White: 4.75')
      till.printPrices
    end
end
