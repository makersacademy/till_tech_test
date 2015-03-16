Given(/^I am on the homepage$/) do
  visit '/'
end

Given(/^I choose "(.*?)" from the menu$/) do |choice|
  click_link choice 
end

Then(/^I should see "(.*?)" on my receipt$/) do |item_name|
  expect(page.find('#receipt-container')).to have_content 'Spaghetti'
end
