require 'rails_helper'

feature 'Hipster using the till' do

  before(:each) do
    visit '/'
  end

  scenario 'Presses "Flat White" and sees the price appear', js: true do
    click_button 'Flat White'
    expect(page).to have_content '4.75'
  end

end