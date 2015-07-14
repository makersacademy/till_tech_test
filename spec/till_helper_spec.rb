require 'rails_helper'

include TillHelper

describe Till do

  it { is_expected.to respond_to :print_receipt }
  it { is_expected.to respond_to(:search).with(1).argument }
  it { is_expected.to respond_to(:search_for_price).with(1).argument }
  it { is_expected.to respond_to :total_cost }
  it { is_expected.to respond_to(:add_item).with(2).arguments }

  it 'can return the name of the coffee shop' do
    expect(subject.search('shopName')).to eq 'The Coffee Connection'
  end

  it 'can return the price of a latte' do
    expect(subject.search_for_price('Cafe Latte')).to eq 4.75
  end

  it 'can add an item to the order' do
    subject.add_item('Cafe Latte', 1)
    expect(subject.order).to eq ["Cafe Latte"]
  end

  it 'can add more than one item at once' do
    subject.add_item('Cappucino', 3)
    expect(subject.order).to eq ["Cappucino"] * 3
  end

  # > **Jane**
  # > 2 x Cafe Latte
  # > 1 x Blueberry Muffin
  # > 1 x Choc Mudcake

  it "can calculate Jane's total cost" do
    subject.add_item('Cafe Latte', 2)
    subject.add_item('Blueberry Muffin', 1)
    subject.add_item('Choc Mudcake', 1)
    expect(subject.total_cost).to eq 19.95
  end

  it 'can calculate tax' do
    subject.add_item('Cafe Latte', 2)
    subject.add_item('Blueberry Muffin', 1)
    subject.add_item('Choc Mudcake', 1)
    expect(subject.tax).to eq '1.72'
  end

  it 'can print a simple receipt' do
    subject.add_item('Cafe Latte', 1)
    receipt = subject.print_receipt
    t = Time.now.strftime("%Y.%m.%d %H:%M:%S")
    expect(receipt).to eq [t, 'The Coffee Connection', '123 Lakeside Way',
    'phone: 16503600708', 'Cafe Latte 1x £4.75', 'Tax: £0.41', 'Total: £4.75']
  end

  context 'with multiple quantities' do

    before(:each) do
      subject.add_item('Cafe Latte', 2)
      subject.add_item('Choc Mousse', 1)
    end

    it 'can produce the correct receipt' do
      receipt = subject.print_receipt
      t = Time.now.strftime("%Y.%m.%d %H:%M:%S")
      expect(receipt).to eq [t, 'The Coffee Connection', '123 Lakeside Way',
      'phone: 16503600708', 'Cafe Latte 2x £4.75', 'Choc Mousse 1x £8.20', 'Tax: £1.53', 'Total: £17.70']
    end

    it 'can take a payment for the total price' do
      total_price = subject.total_cost
      receipt = subject.pay(total_price)
      expect(receipt).to include 'Cash: £17.70'
    end

    it 'can calculate change' do
      receipt = subject.pay(20)
      expect(receipt).to include 'Change: £2.30'
    end

  end

  context 'discounts' do

    it 'for muffins' do
      subject.add_item('Blueberry Muffin', 1)
      receipt = subject.print_receipt
      expect(receipt).to include '10% Muffin Discount: -£0.41'
    end

    it 'correct total for muffin discount' do
      subject.add_item('Blueberry Muffin', 1)
      receipt = subject.print_receipt
      expect(receipt).to include 'Total: £3.64'
    end

    it 'for orders over £50' do
      subject.add_item('Affogato', 4)
      receipt = subject.print_receipt
      expect(receipt).to include '5% Discount: -£2.96'
    end

    it 'with correct total for over £50' do
      subject.add_item('Affogato', 4)
      receipt = subject.print_receipt
      expect(receipt).to include 'Total: £56.24'
    end
  end
end