Given(/^I am on the homepage$/) do
  visit('/')
end

When(/^I click on "(.*?)"$/) do |arg1|
  click_button("Cafe Latte")
end

When(/^I click on "(.*?)" again$/) do |arg1|
  click_button("Cafe Latte")
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_content("Cafe Latte x 1")
end
