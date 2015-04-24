require 'till'

describe Till do

  it 'can receive an order for a latte' do
    expect(subject.order :latte).to eq nil
  end

  describe 'calculates' do
    it 'the correct total for 2 cafe lattes' do
      2.times { subject.order(:latte) }
      expect(subject.checkout).to eq '9.50'
    end

    it 'the correct total for 4 americanos' do
      4.times { subject.order(:americano) }
      expect(subject.checkout).to eq '15.00'
    end
  end

  describe 'shows' do
    it 'the correct line item for 2 caffe lattes' do
      2.times { subject.order(:latte) }
      expect(subject.line_items).to include '2 x Caffe Latte'
    end
  end

end
