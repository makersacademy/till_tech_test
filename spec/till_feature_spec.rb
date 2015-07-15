require 'rails_helper'

feature 'Hipster using the till' do

  before(:each) do
    visit '/'
  end

  scenario 'Presses "Flat White" and sees the price appear', js: true do
    click_button 'Flat White'
    expect(page).to have_content '4.75'
  end

  scenario 'Can see the order for an individual item', js: true do
    click_button 'Flat White'
    expect(page).to have_content 'Flat White £4.75'
  end

  scenario 'Cannot take payment before ordering', js: true do
    expect(page).to have_button('5', disabled: true)
  end

  context 'Discounts' do

    scenario 'Presses "Blueberry Muffin" and sees the discount', js: true do
      click_button 'Blueberry Muffin'
      expect(page).to have_content '10% Muffin Discount -£0.41'
      expect(page).to have_content 'Total: £3.64'
    end

  end

  context 'Payments' do

    before(:each) do
      click_button 'Flat White'
      click_button 'Cafe Latte'
      click_button 'Cappucino'
    end

    scenario 'Can see a running total for several items', js: true do
      expect(page).to have_content 'Total: £13.35'
    end

    scenario 'Can take payment', js: true do
      click_button '1'
      click_button '5'
      click_button 'Pay'
      expect(current_path).to eq '/till/new'
    end

    scenario 'Can clear payment', js: true do
      click_button '1'
      click_button '5'
      expect(page.find('#payment')).to have_content '£15'
      click_button 'Clear'
      expect(page.find('#payment')).not_to have_content '£15'
    end

    scenario 'Cannot take payment if insufficient funds', js: true do
      click_button '5'
      expect(page).not_to have_button 'Pay'
    end

    scenario 'Hides pay button again if insufficient funds', js: true do
      click_button '1'
      click_button '5'
      expect(page).to have_button 'Pay'
      click_button 'Tea'
      expect(page).not_to have_button 'Pay'
    end

    scenario 'Prints the receipt for the order', js: true do
      click_button '1'
      click_button '5'
      click_button 'Pay'
      expect(page).to have_content "The Coffee Connection 123 Lakeside Way
      phone: 16503600708 Flat White 1x £4.75 Cafe Latte 1x £4.75 Cappucino 1x £3.85 Tax: £1.15 Total: £13.35 Cash: £15.00 Change: £1.65"
    end

  end

end