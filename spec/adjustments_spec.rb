require_relative '../app/lib/adjustments'

describe 'adjustments' do

  let(:shop)        {double(:shop)   }
  let(:order)       {Order.new}
  let(:adjustments) {Adjustments.new}
  let(:till)        {Till.new}

  it 'can calculate a 5% discount for orders over $50' do
    add_many_items
    expect(adjustments.discount(till.subtotal_of(order.list))).to eq(63.41)
  end

  it 'doesnt do a discount for orders under $50' do
    add_items
    expect(adjustments.discount(till.subtotal_of(order.list))).to eq(13.35)
  end

  it 'can calculate a 10% discount on muffins' do
    add_muffin
    expect(till.subtotal_of(adjustments.item_discount(order.list))).to eq(3.65)
  end

  it 'doesnt calculate a 10% discount for non-muffins' do
    add_items
    expect(till.subtotal_of(adjustments.item_discount(order.list))).to eq(13.35)
  end

  it 'can show the total amount the discount was calculated on for muffins' do
    add_muffin
    expect(adjustments.item_discount_total(order.list)).to eq(4.05)
  end

end