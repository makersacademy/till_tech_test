Given(/^I am on the homepage$/) do
  visit '/'
end

Given(/^I choose an item from the menu$/) do
  page.first('.menu-item').click(); 
end

Then(/^I should see it appear on my receipt$/) do 
  expect(page.find('#receipt-container')).to have_content 'Cafe Latte' 
end
