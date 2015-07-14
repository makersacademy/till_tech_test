require 'rails_helper'

feature 'Hipster using the till' do

  before(:each) do
    visit '/'
  end

  scenario 'Presses "Flat White" and sees the price appear', js: true do
    click_button 'Flat White'
    expect(page).to have_content '4.75'
  end

  scenario 'Prints a simple bill for flat white', js: true do
    click_button 'Flat White'
    click_on 'Print Receipt'
    t = Time.now.strftime("%Y.%m.%d %H:%M:%S")
    expect(page).to have_content "#{t} The Coffee Connection 123 Lakeside Way
    phone: 16503600708 Flat White 1x £4.75 Tax: £0.41 Total: £4.75"
  end

end