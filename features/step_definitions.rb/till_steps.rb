Given(/^I am on the homepage$/) do
  visit('/')
  click_link 'Clear current order'
end

Then(/^I should see "(.*?)"$/) do |shopName|
  expect(page).to have_content(shopName)
end

Given(/^I select "(.*?)" from "(.*?)"$/)  do |selection, dropdown|
  select selection, from: dropdown
end

Given(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in field , with: value
end

Given(/^I click "(.*?)"$/) do |button|
  click_button button
end

Given(/^I have added one item already$/) do
  visit '/'
  click_link 'Clear current order'
  select 'Cafe Latte', from: 'menu-dropdown'
  fill_in 'quantity' , with: 2
  click_button 'Submit Order Item'
end

Given(/^I have added Jane's order$/) do
  visit('/')
  click_link 'Clear current order'
  select 'Cafe Latte', from: 'menu-dropdown'
  fill_in 'quantity' , with: 2
  click_button 'Submit Order Item'
  select 'Blueberry Muffin', from: 'menu-dropdown'
  fill_in 'quantity' , with: 1
  click_button 'Submit Order Item'
  select 'Choc Mudcake', from: 'menu-dropdown'
  fill_in 'quantity' , with: 1
  click_button 'Submit Order Item'
end

Then(/^I should see Jane's receipt$/) do
  expect(page).to have_content('Cafe Latte 2 x 4.75')
  expect(page).to have_content('Blueberry Muffin 1 x 4.05')
  expect(page).to have_content('Choc Mudcake 1 x 6.40')
  expect(page).to have_content('Discount 0.41')
  expect(page).to have_content('Tax 1.69')
  expect(page).to have_content('Total 21.23')
end
