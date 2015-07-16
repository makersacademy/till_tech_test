require 'till'

feature Till do
  context 'Create new till' do
    let(:till) { Till.new }

    scenario 'it should load items' do
      expect(till.data).not_to be nil
    end

    scenario 'it should load Shop Name' do
      expect(till.data[0][:shopName]).to eq 'The Coffee Connection'
    end

    scenario 'it should load Tiramisu & price' do
      expect(till.data[0][:prices][0][:Tiramisu]).to eq 11.40
    end
  end
end
